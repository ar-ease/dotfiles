// ==UserScript==
// @name         Block Cmd+S Hijack
// @namespace    http://zen.local/
// @version      1.0
// @description  Prevent sites from hijacking Cmd+S / Ctrl+S
// @match        *://*/*
// @grant        none
// ==/UserScript==

document.addEventListener(
  "keydown",
  function (e) {
    if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === "s") {
      e.stopImmediatePropagation();
      e.preventDefault();
      // Let the browser handle native Save dialog
    }
  },
  true,
);
