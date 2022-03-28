# Emacs generate index

This emacs script wraps the VisualStudio Code extension 'Generate Index' by JayFong
("Generate Index")[https://marketplace.visualstudio.com/items?itemName=JayFong.generate-index]

It runs npx to install the CLI version of the extension and then executes it in the index.ts
file that you have open.

## TODOs

* Check if you have the CLI already installed to avoid running NPX, as it is slower.
* Evaluate if it's sensible to recreate the extension completly in Elisp.
