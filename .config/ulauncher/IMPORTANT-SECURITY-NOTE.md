# Security Note for Ulauncher Extension Preferences

## Removed Files for Security

The following extension preference files were **intentionally removed** from this repository because they contained sensitive information:

### 🔒 Removed Files:
- `com.github.pascalbe-dev.ulauncher-todoist-capture.db` - **Contained API token**
- `com.github.eckhoff42.ulauncher-bluetooth-quick-connect.db` - **Contained device MAC addresses**

## What This Means

1. **These extensions will need to be reconfigured** after installing the dotfiles
2. **API tokens** must be re-entered manually for Todoist integration
3. **Bluetooth devices** must be re-paired/configured in the Bluetooth extension

## How to Reconfigure

### Todoist Extensions:
1. Install the extension through Ulauncher preferences
2. Enter your Todoist API token (get from: https://todoist.com/prefs/integrations)
3. Configure keywords and preferences

### Bluetooth Extension:
1. Install the extension through Ulauncher preferences  
2. Pair your Bluetooth devices through the extension interface
3. Configure quick-connect shortcuts

## Security Best Practices

- **Never commit API tokens, keys, or device identifiers to public repositories**
- **Always review configuration files** before pushing to GitHub
- **Use environment variables or secure vaults** for sensitive data in production setups

---
*This security measure ensures your personal data and API credentials remain private.*
