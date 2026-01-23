# `wispr-paste-mode.el`

An Emacs minor mode that adds support for Wispr Flow dictation on macOS.

## Description

This minor mode remaps `M-v` to paste from the system clipboard,
working around Wispr Flow's macOS paste behavior.

Wispr Flow expects every application to accept `M-v` to enter freshly
dictated text from the clipboard. This mode overrides the default
`M-v` binding to perform `yank` instead, and when toggled off, resets
the binding to its original state.

## Usage

To toggle it on/off:

`M-x wispr-paste-mode`

When enabled, `M-v` will insert clipboard contents at point instead of
the default Emacs behavior (typically scrolling down).

## Installation

```
(use-package wispr-paste-mode
  :commands (wispr-paste-mode)
  :vc (:url "https://github.com/dotemacs/wispr-paste-mode.el"))
```

Or load it manually, by adding `wispr-paste-mode.el` to your
`load-path` and require it:

```elisp
(add-to-list 'load-path "/path/to/wispr-paste-mode.el")
(require 'wispr-paste-mode)
```
