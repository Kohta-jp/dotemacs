(require 'solarized)
(deftheme solarized-iceberg-dark "The solarized-iceberg-dark colour theme of Solarized colour theme flavor.")
(solarized-with-color-variables 'dark 'solarized-iceberg-dark
  '((base03 . "#0000ff")
    (base02 . "#2a12ff")
    (base01 . "#9569ff")
    (base00 . "#a074ff")
    (base0 . "#b690ff")
    (base1 . "#c19dff")
    (base2 . "#f7f1ff")
    (base3 . "#ffffff")
    (yellow . "#e2a478")
    (orange . "#e27878")
    (red . "#e27878")
    (magenta . "#a093c7")
    (violet . "#b4be82")
    (blue . "#84a0c6")
    (cyan . "#89b8c2")
    (green . "#84a0c6")
    (yellow-d . "#8a44de")
    (yellow-l . "#ffffd9")
    (orange-d . "#8d00ce")
    (orange-l . "#ffd9cb")
    (red-d . "#8d00ce")
    (red-l . "#ffd9cb")
    (magenta-d . "#6a00ff")
    (magenta-l . "#ffdcff")
    (violet-d . "#8a44de")
    (violet-l . "#ffffd9")
    (blue-d . "#424eff")
    (blue-l . "#e2ffff")
    (cyan-d . "#424eff")
    (cyan-l . "#e2ffff")
    (green-d . "#424eff")
    (green-l . "#e2ffff")
    (yellow-1bg . "#7937e6")
    (orange-1bg . "#7c00da")
    (red-1bg . "#7c00da")
    (magenta-1bg . "#5b00ff")
    (blue-1bg . "#3a41ff")
    (cyan-1bg . "#3a41ff")
    (green-1bg . "#3a41ff")
    (violet-1bg . "#7937e6")
    (yellow-1fg . "#ffff73")
    (orange-1fg . "#ff7352")
    (red-1fg . "#ff7352")
    (magenta-1fg . "#ff7bff")
    (violet-1fg . "#ffff73")
    (blue-1fg . "#8affff")
    (cyan-1fg . "#8affff")
    (green-1fg . "#8affff")
    (yellow-2bg . "#b973bc")
    (orange-2bg . "#ba009f")
    (red-2bg . "#ba009f")
    (magenta-2bg . "#9800ff")
    (violet-2bg . "#b973bc")
    (blue-2bg . "#547cff")
    (cyan-2bg . "#547cff")
    (green-2bg . "#547cff")
    (yellow-2fg . "#ffff93")
    (orange-2fg . "#ff9475")
    (red-2fg . "#ff9475")
    (magenta-2fg . "#ff9bff")
    (violet-2fg . "#ffff93")
    (blue-2fg . "#a9ffff")
    (cyan-2fg . "#a9ffff")
    (green-2fg . "#a9ffff"))
  '((custom-theme-set-faces theme-name
                            `(default
                              ((,class
                                (:foreground ,base3 :background ,base03))))
                            `(vertical-border
                              ((,class
                                (:foreground ,base03))))
                            `(mode-line
                              ((,class
                                (:foreground ,base2 :background ,base02))))
                            `(mode-line-inactive
                              ((,class
                                (:foreground ,base0 :background ,base03))))
                            `(font-lock-comment-delimiter-face
                              ((,class
                                (:foreground "#6b7089"))))
                            `(font-lock-comment-face
                              ((,class
                                (:foreground "#6b7089"))))
                            `(font-lock-preprocessor-face
                              ((,class
                                (:foreground ,green))))
                            `(font-lock-type-face
                              ((,class
                                (:foreground ,cyan))))
                            `(font-lock-builtin-face
                              ((,class
                                (:foreground ,green))))
                            `(diff-function
                              ((,class
                                (:foreground ,violet-1fg))))
                            `(diff-header
                              ((,class
                                (:foreground ,green))))
                            `(diff-hunk-header
                              ((,class
                                (:foreground ,green))))
                            `(diff-file-header
                              ((,class
                                (:background ,base03 :foreground ,green))))
                            `(diff-added
                              ((,class
                                (:background ,violet-1bg :foreground ,violet-1fg))))
                            `(diff-indicator-added
                              ((t
                                (:foreground ,violet))))
                            `(markdown-header-face
                              ((,class
                                (:foreground ,yellow))))
                            `(markdown-header-rule-face
                              ((,class
                                (:foreground ,green))))
                            `(markdown-markup-face
                              ((,class
                                (:inherit default))))
                            `(markdown-url-face
                              ((,class
                                (:foreground ,magenta))))
                            `(markdown-link-face
                              ((,class
                                (:foreground ,green :underline t))))
                            `(markdown-inline-code-face
                              ((,class
                                (:foreground ,cyan))))
                            `(markdown-pre-face
                              ((,class
                                (:foreground ,cyan))))
                            `(sh-quoted-exec
                              ((,class
                                (:foreground ,violet))))
                            `(haskell-type-face
                              ((,class
                                (:inherit default))))
                            `(haskell-constructor-face
                              ((,class
                                (:inherit default))))
                            `(haskell-operator-face
                              ((,class
                                (:foreground ,green))))
                            `(haskell-definition-face
                              ((,class
                                (:inherit default))))
                            `(web-mode-block-delimiter-face
                              ((,class
                                (:inherit default))))
                            `(web-mode-html-attr-value-face
                              ((,class
                                (:foreground ,cyan))))
                            `(web-mode-mode-type-face
                              ((,class
                                (:inherit default))))
                            `(web-mode-function-call-face
                              ((,class
                                (:inherit default))))
                            `(web-mode-keyword-face
                              ((,class
                                (:foreground ,green))))
                            `(web-mode-constant-face
                              ((,class
                                (:foreground ,cyan))))
                            `(web-mode-variable-name-face
                              ((,class
                                (:foreground ,cyan))))
                            `(web-mode-html-tag-bracket-face
                              ((,class
                                (:foreground ,green))))
                            `(org-verbatim
                              ((,class
                                (:foreground ,cyan))))
                            `(php-php-tag
                              ((,class
                                (:inherit default))))
                            `(php-constant
                              ((,class
                                (:inherit default))))
                            `(php-paamayim-nekudotayim
                              ((,class
                                (:foreground ,green))))
                            `(php-object-op
                              ((,class
                                (:foreground ,cyan))))
                            `(php-variable-name
                              ((,class
                                (:foreground ,cyan))))
                            `(php-variable-sigil
                              ((,class
                                (:foreground ,cyan)))))))
(provide-theme 'solarized-iceberg-dark)
(provide 'solarized-iceberg-dark-theme)
