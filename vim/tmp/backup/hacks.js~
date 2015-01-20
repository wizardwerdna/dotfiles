'use strict';
function HEREDOC(func) {
  var matches = func.toString().match(/function\s*\(\)\s*\{\s*\/\*\!?\s*([\s\S]+?)\s*\*\/\s*\}/);
  if (!matches) { return false; }
  return matches[1];
}
