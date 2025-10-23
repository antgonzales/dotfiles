# OpenCode System Theme Monitoring Fix Contribution Plan

## Overview

Fix the system theme monitoring bug in [opencode](https://github.com/sst/opencode) to enable real-time system appearance detection, allowing all system themes to automatically update without restart.

## Problem Statement

### Current Issues
1. **Bug #1364**: The existing `"system"` theme doesn't update automatically when system appearance changes - requires restart
2. **No Real-time Detection**: Current system theme only detects appearance at startup
3. **Terminal Theme Inheritance Broken**: System theme can't monitor when terminal color palette changes

### Root Cause
The system theme currently:
- ✅ **Detects system/terminal appearance** at startup
- ❌ **Monitors real-time changes** to system appearance
- ❌ **Updates theme dynamically** without restart

### User Impact
- Users must restart opencode when system appearance changes
- Breaks seamless dark/light mode workflow
- Affects all users of system theme, regardless of terminal or colorscheme

### User Need
- Developers want seamless integration between system dark/light mode and opencode
- System theme should work automatically like other applications
- Need real-time updates without restarting opencode
- Terminal color palette changes should be detected immediately

## Solution: System Theme Monitoring Fix

### Core Fix
Implement real-time system appearance monitoring that:
- **Monitors System Appearance**: Tracks macOS/Linux system dark/light mode changes
- **Detects Terminal Changes**: Monitors when terminal color palette updates  
- **Real-time Updates**: Updates theme immediately when changes detected
- **Universal Benefit**: Fixes system theme for all users and terminal setups

### How System Theme Currently Works
```
macOS Dark/Light Mode → Terminal Theme (iTerm/Alacritty/etc) → opencode "system" theme
```

The system theme:
- **Reads terminal's color palette** and background color
- **Adapts UI elements** to match terminal appearance
- **Uses terminal's ANSI colors** for syntax highlighting
- **Preserves terminal's native appearance**

**Problem**: No monitoring for when this chain updates

## Technical Implementation

### System Detection Enhancement
Implement comprehensive system appearance monitoring:

#### macOS Detection
- **Primary**: Monitor `defaults read -g AppleInterfaceStyle`
- **Fallback**: Check terminal background color changes
- **Integration**: Use existing macOS appearance APIs if available

#### Linux Detection  
- **Primary**: Monitor `org.freedesktop.appearance.color-scheme`
- **Fallback**: Watch for terminal palette changes
- **Desktop Integration**: Support GNOME, KDE, and other DEs

#### Terminal Monitoring
- **Color Palette Detection**: Monitor terminal's ANSI color changes
- **Background Detection**: Track terminal background color shifts
- **Multi-terminal Support**: Work with iTerm, Alacritty, Kitty, etc.

### Monitoring Strategy
- **Polling Interval**: Check system appearance every 3-5 seconds
- **Event-driven**: Use system notifications when available
- **Performance Optimized**: Minimal CPU/battery impact
- **Error Handling**: Graceful fallbacks when detection fails

### Update Mechanism
- **Hot Reloading**: Update theme without restart
- **State Management**: Track current vs new appearance
- **Debouncing**: Prevent rapid theme switching
- **User Feedback**: Optional notifications for theme changes

### Integration Points
1. **System Detection Module**: Enhance existing system detection logic
2. **Theme Engine**: Add hot-reloading capability to theme system
3. **Event System**: Implement appearance change notifications
4. **Configuration**: Allow users to configure monitoring interval

## Contribution Strategy

### Phase 1: Research & Analysis
- [ ] Study existing system theme implementation
- [ ] Analyze current system detection mechanisms
- [ ] Identify monitoring gaps and limitations
- [ ] Research platform-specific appearance APIs

### Phase 2: Core Monitoring Implementation
- [ ] Implement system appearance polling mechanism
- [ ] Add terminal color palette detection
- [ ] Create cross-platform detection abstraction
- [ ] Add proper error handling and fallbacks

### Phase 3: Theme Engine Enhancement
- [ ] Implement hot-reloading for system theme
- [ ] Add theme update event system
- [ ] Optimize performance and resource usage
- [ ] Test across different terminal environments

### Phase 4: Integration & Testing
- [ ] Test on macOS with various terminals (iTerm, Terminal.app, etc.)
- [ ] Test on Linux with different desktop environments
- [ ] Verify performance impact is minimal
- [ ] Test edge cases (SSH, TTY, remote sessions)

### Phase 5: Documentation & Submission
- [ ] Document new monitoring capabilities
- [ ] Update configuration options
- [ ] Create comprehensive PR description
- [ ] Address code review feedback

## Value Proposition

### For Users
- **Seamless Experience**: System theme works automatically with system appearance
- **Universal Fix**: Benefits all users of system theme, regardless of terminal or colorscheme
- **No Manual Intervention**: Works without user configuration
- **Real-time Updates**: No restart required for appearance changes

### For Project
- **Critical Bug Fix**: Resolves Issue #1364 affecting all system theme users
- **Infrastructure Improvement**: Enhances core theme system functionality
- **Enables Future Features**: Provides foundation for system-aware themes
- **Broad Impact**: Benefits entire user base using system theme

## Success Metrics

### Functionality
- [ ] System theme updates automatically with system appearance changes
- [ ] Real-time updates without restart
- [ ] Works across supported platforms (macOS, Linux)
- [ ] Maintains performance standards
- [ ] Supports various terminal emulators

### Code Quality
- [ ] Follows opencode contribution guidelines
- [ ] Passes all existing tests
- [ ] Includes appropriate error handling
- [ ] Well-documented and maintainable
- [ ] Minimal performance impact

### Community Impact
- [ ] Resolves Issue #1364 for all affected users
- [ ] Positive community feedback
- [ ] Enables system theme adoption
- [ ] Sets foundation for future system-aware features

## Resources

### References
- [OpenCode GitHub Repository](https://github.com/sst/opencode)
- [OpenCode Theme Documentation](https://opencode.ai/docs/themes/)
- [Issue #1364 - System Theme Bug](https://github.com/sst/opencode/issues/1364)
- [auto-dark-mode.nvim Implementation](https://github.com/f-person/auto-dark-mode.nvim) (reference for monitoring approach)

### Similar Implementations
- Our Neovim auto-dark-mode setup (polling strategy reference)
- Existing opencode system theme (foundation to build upon)
- Other terminal applications with system theme support
- macOS/Linux system appearance APIs

## Timeline

**Estimated Duration**: 1-2 weeks

- **Week 1**: Research, analysis, and core monitoring implementation
- **Week 2**: Testing, integration, documentation, and PR submission

## Next Steps

1. **Comment on Issue #1364**: Propose fix approach and get feedback
2. **Fork Repository**: Set up development environment
3. **Start Implementation**: Begin with system monitoring enhancement
4. **Engage Community**: Get feedback from affected users and maintainers