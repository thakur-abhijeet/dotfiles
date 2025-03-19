if status is-login
    keychain --eval --agents ssh id_ed25519 | source
end
