module.exports = {
  extends: [
    'stylelint-config-standard',
    'stylelint-config-prettier'
  ],
  // add your custom config here
  // https://stylelint.io/user-guide/configuration
  rules: {
    'font-family-no-duplicate-names': true,
    'block-no-empty': true,
    'comment-no-empty': true,
    'no-duplicate-at-import-rules': true,
    'no-duplicate-selectors': true,
    'no-empty-source': true,
    'no-empty-first-line': true,
    'no-extra-semicolons': true,
    'no-irregular-whitespace': true,
    'no-invalid-double-slash-comments': true,
    'no-invalid-position-at-import-rule': true,
    'indentation': 2,
    'length-zero-no-unit': false
  }
}
