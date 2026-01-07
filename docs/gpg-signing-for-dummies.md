# GPG Signing for Dummies

A practical guide to setting up GPG signing for Git commits in dev containers.

## Why GPG Sign Commits?

GPG signing verifies that commits actually came from you. On GitHub, signed commits show a "Verified" badge, proving authenticity and compliance with quality-by-design principles.

## Part 1: Generate Your GPG Key Locally

Do this **on your host machine** (not in the dev container).

### Step 1: Generate a new key

```bash
gpg --full-generate-key
```

When prompted, choose:

- **Key type**: RSA and RSA (default)
- **Key size**: 4096 (recommended)
- **Expiration**: 2 years (or your preference)
- **Name**: Your full name
- **Email**: The email linked to your GitHub account
- **Passphrase**: A strong password (you can change this later)

### Step 2: List your keys to find the key ID

```bash
gpg --list-secret-keys --keyid-format=long
```

Look for output like:

```bash
sec   rsa4096/8E5764461FC4138F 2026-01-07 [SC] [expires: 2028-01-07]
      ...
uid                 [ultimate] Lars Kruse (@lakruzz) <lars@lakruzz.com>
```

Your **key ID** is the long hex string after the key type (e.g., `8E5764461FC4138F`).

## Part 2: Use Your Key in the Dev Container

### Step 1: Export your key as base64

On your **host machine**, export your secret key and encode it as base64:

```bash
gpg --export-secret-keys 8E5454461FB4298F | base64 > ~/gpg-key-base64.txt
```

Copy the entire output.

### Step 2: Set the `$_GPG_KEY` environment variable on your host machine

The dev container reads the `_GPG_KEY` environment variable from your host machine. Set it once on your host:

```bash
export _GPG_KEY="$(cat ~/gpg-key-base64.txt)"
```

For permanent use, add it to your shell profile that runs on **login** (`~/.zprofile` for zsh, `~/.bash_profile` for bash):

```bash
echo 'export _GPG_KEY="<your-base64-encoded-key>"' >> ~/.zprofile
```

### Step 3: The container handles the rest

When you start (or rebuild) the dev container, the `postCreateCommand.sh` automatically runs `gpg-auth.sh`, which:

- Decodes the base64 key
- Imports it into GPG
- Configures Git to use the key for signing
- Sets the key trust to ultimate

No manual configuration needed! Your commits will be signed automatically.

## Part 3: Test Your Setup

### Make a test commit

```bash
git commit --allow-empty -m "Test GPG signing"
```

You may be prompted for your passphrase (if you have one).

### Verify the signature

```bash
git log --show-signature
```

You should see output like:

```bash
gpg: Signature made Wed 07 Jan 2026 02:33:33 PM UTC
gpg:                using RSA key 50D5D3E699989A92948A8C9F8E5454461FB4298F
gpg: Good signature from "Lars Kruse (@lakruzz) <lars@lakruzz.com>" [ultimate]
```

## Part 4: Add Your Public Key to GitHub

### Export your public key

```bash
gpg --armor --export 8E5454461FB4298F
```

Copy the output (from `-----BEGIN PGP PUBLIC KEY BLOCK-----` to `-----END PGP PUBLIC KEY BLOCK-----`).

### Add it to GitHub

1. Go to [**GitHub** → **Settings** → **SSH and GPG keys**](https://github.com/settings/keys)
2. Click **New GPG key**
3. Paste your public key
4. Click **Add GPG key**

Now, when you push commits signed with this key, GitHub will show a "Verified" badge.

## Troubleshooting

### `gpg --list-secret-keys` shows nothing

**Problem**: The key didn't import properly, or the GPG agent isn't communicating with your terminal.

**Solution**:

```bash
gpg-agent --daemon
export GPG_TTY=$(tty)
gpg --list-secret-keys
```

### "Inappropriate ioctl for device" error

This error appears during import but doesn't prevent the key from being imported. It's safe to ignore, especially in containers.

### Commits not showing as verified on GitHub

- Verify the public key is on GitHub (Settings → SSH and GPG keys)
- Check that the email in your Git config matches the email in your GPG key:

  ```bash
  git config user.email
  gpg --list-keys
  ```

- Re-add your public key to GitHub if you edited your GPG key (added a UID, changed comment, etc.)

## Quick Reference

| Task | Command |
| ---- | ------- |
| Generate key | `gpg --full-generate-key` |
| List keys | `gpg --list-secret-keys` |
| Edit key (passphrase, comment, UID) | `gpg --edit-key <KEY_ID>` |
| Export public key | `gpg --armor --export <KEY_ID>` |
| Import key | `gpg --import <key-file>` |
| Configure Git | `git config --global user.signingkey <KEY_ID>` |
| Enable auto-signing | `git config --global commit.gpgSign true` |
| Test signed commit | `git commit --allow-empty -m "test"` |
| Verify signature | `git log --show-signature` or `git verify-commit <commit>` |
