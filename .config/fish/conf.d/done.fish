# =============================================================================
# done.fish - Smart Command Completion Notifications for Fish Shell
# =============================================================================
# MIT License
# Original Authors: Francisco Lourenço & Daniel Wehner
# Refactored for personal modular use in ~/.config/fish/conf.d/
# =============================================================================

# Exit immediately if shell is non-interactive (e.g., scripts)
if not status is-interactive
    exit
end

# Version of the plugin
set -g __done_version 1.19.1

# =============================================================================
# Helper: Run PowerShell scripts (Windows / WSL support)
# =============================================================================
function __done_run_powershell_script
    set -l powershell_exe (command --search "powershell.exe")
    if test $status -ne 0
        command --search wslvar
        set -l powershell_exe (wslpath (wslvar windir)/System32/WindowsPowerShell/v1.0/powershell.exe)
    end
    if string length --quiet "$powershell_exe" and test -x "$powershell_exe"
        set cmd (string escape $argv)
        eval "$powershell_exe -Command $cmd"
    end
end

# =============================================================================
# Windows toast notification helper
# =============================================================================
function __done_windows_notification -a title -a message
    set soundopt "<audio silent=\"true\" />"
    if test "$__done_notify_sound" -eq 1
        set soundopt "<audio silent=\"false\" src=\"ms-winsoundevent:Notification.Default\" />"
    end

    __done_run_powershell_script "
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null

\$toast_xml_source = @\"
<toast>
  $soundopt
  <visual>
    <binding template=\"ToastText02\">
      <text id=\"1\">$title</text>
      <text id=\"2\">$message</text>
    </binding>
  </visual>
</toast>
\"@

\$toast_xml = New-Object Windows.Data.Xml.Dom.XmlDocument
\$toast_xml.loadXml(\$toast_xml_source)
\$toast = New-Object Windows.UI.Notifications.ToastNotification \$toast_xml
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier(\"fish\").Show(\$toast)
"
end

# =============================================================================
# Detect focused terminal / window (X11, Wayland, tmux, screen, Windows)
# =============================================================================
function __done_get_focused_window_id
    # GNOME / X11 / Wayland / Hyprland support
    if type -q lsappinfo
        lsappinfo info -only bundleID (lsappinfo front | string replace 'ASN:0x0-' '0x') | cut -d '"' -f4
    else if test -n "$SWAYSOCK"; and type -q jq
        swaymsg --type get_tree | jq '.. | objects | select(.focused == true) | .id'
    else if test -n "$HYPRLAND_INSTANCE_SIGNATURE"
        hyprctl activewindow | awk '/^\tpid: / {print $2}'
    else if uname -a | string match --quiet --ignore-case --regex microsoft
        __done_run_powershell_script '
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WindowsCompat {
  [DllImport("user32.dll")]
  public static extern IntPtr GetForegroundWindow();
}
"@
[WindowsCompat]::GetForegroundWindow()
'
    else if set -q __done_allow_nongraphical
        echo 12345 # dummy value if graphical detection unavailable
    end
end

# =============================================================================
# Detect if command window is active (tmux, screen, etc.)
# =============================================================================
function __done_is_process_window_focused
    if set -q __done_allow_nongraphical
        return 1
    end

    set __done_focused_window_id (__done_get_focused_window_id)
    if test "$__done_initial_window_id" != "$__done_focused_window_id"
        return 1
    end

    if type -q tmux and test -n "$TMUX"
        tmux list-panes -a -F "#{session_attached} #{window_active} #{pane_pid}" | string match -q "1 1 $fish_pid"
        return $status
    end

    if type -q screen and test -n "$STY"
        string match --quiet --regex "$STY\s+\(Attached" (screen -ls)
        return $status
    end

    return 0
end

# =============================================================================
# Human-readable duration formatting
# =============================================================================
function __done_humanize_duration -a milliseconds
    set -l seconds (math --scale=0 "$milliseconds/1000" % 60)
    set -l minutes (math --scale=0 "$milliseconds/60000" % 60)
    set -l hours (math --scale=0 "$milliseconds/3600000")
    if test $hours -gt 0
        printf '%s' $hours'h '
    end
    if test $minutes -gt 0
        printf '%s' $minutes'm '
    end
    if test $seconds -gt 0
        printf '%s' $seconds's'
    end
end

# =============================================================================
# Main enablement & default settings
# =============================================================================
set -q __done_enabled; or set -g __done_enabled 1
set -q __done_min_cmd_duration; or set -g __done_min_cmd_duration 5000
set -q __done_exclude; or set -g __done_exclude '^git (?!push|pull|fetch)'
set -q __done_notify_sound; or set -g __done_notify_sound 0
set -q __done_notification_duration; or set -g __done_notification_duration 3000

# Capture window ID before command execution
function __done_started --on-event fish_preexec
    set __done_initial_window_id (__done_get_focused_window_id)
end

# Post-command notification
function __done_ended --on-event fish_postexec
    set -l exit_status $status
    set -q cmd_duration; or set -l cmd_duration $CMD_DURATION
    if test $cmd_duration -gt $__done_min_cmd_duration
        and not __done_is_process_window_focused
        set -l humanized_duration (__done_humanize_duration "$cmd_duration")
        set -l title "Done in $humanized_duration"
        set -l message (pwd)"/ $argv[1]"
        notify-send --urgency=normal --icon=utilities-terminal --app-name=fish "$title" "$message"
    end
end
