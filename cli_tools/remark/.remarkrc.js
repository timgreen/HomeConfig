module.exports = {
  // Setting for remark-stringify
  settings: {
    bullet: '*',
    fences: true,
    incrementListMarker: true,
    listItemIndent: 'tab',
    rule: '-',
    ruleRepetition: 80,
    ruleSpaces: false,
    strong: '*',
    emphasis: '_',
    stringLength: function(s) {
      return s.replace(/\[(.+)\]\(.+\)/g, function(a, b) {
        return b;
      }).length;
    },
  },
  // Setting for remark-lint
  plugins: [
    'remark-math',
    'remark-preset-lint-recommended',
    'remark-frontmatter',
    ['remark-lint-list-item-indent', 'tab-size'],
    ['remark-lint-maximum-line-length', ['warn', 80]],
  ],
};
