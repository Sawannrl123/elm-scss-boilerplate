export const activeMenu = () => {
  var addEvent = (function () {
      return window.addEventListener ?
        function (el, ev, fn) {
          el.addEventListener(ev, fn, false);
        } :
        function (el, ev, fn) {
          el.attachEvent('on' + ev, function () {
            fn.call(el);
          });
        }
    })(),

    hasClass = function (el, className) {
      return (' ' + el.className + ' ').indexOf(' ' + className + ' ') != -1;
    },

    getElementsByClass = function (c, node, tag) {
      node = node || document;
      var els = tag || '*';
      var elements = node.getElementsByTagName(els);
      var matchedArray = [];
      for (var i = 0, l = elements.length; i < l; i++) {
        if (hasClass(elements[i], c)) {
          matchedArray.push(elements[i]);
        }
      }
      return matchedArray;
    }

  var addClass = function (c, e) {
    e.className += ` ${c}`;
  };

  var removeClass = function (c, e) {

    e.className = e.className.replace(c, '');
  };


  if (typeof Array.prototype.forEach == 'undefined') {
    Array.prototype.forEach = function (fn) {
      var len = this.length,
        thisp = arguments[1];
      for (var i = 0; i < len; ++i) {
        fn.call(thisp, this[i], i, this);
      }
    }
  }

  addEvent(window, 'load', init);

  function init() {
    var nav = document.getElementById('nav'), // update nav ID here
      activeClass = 'active', // update current class here
      current = getElementsByClass(activeClass, nav, 'a')[0],
      lis = nav.getElementsByTagName('a');
    // since we're dealing with a nodeList
    Array.prototype.forEach.call(lis, function (el) {
      addEvent(el, 'click', function (e) {
        if (!hasClass(this, activeClass)) {
          removeClass(activeClass, current);
          addClass(activeClass, el);
          current = el;
          if (e.preventDefault) {
            e.preventDefault();
          } else {
            e.returnValue = false;
          }
        }
      });
    });

  }
}