!function(){function n(){if(classie.has(i,"open")){classie.remove(i,"open"),classie.add(i,"close");var n=function(e){if(support.transitions){if("visibility"!==e.propertyName)return;this.removeEventListener(transEndEventName,n)}classie.remove(i,"close")};support.transitions?i.addEventListener(transEndEventName,n):n()}else classie.has(i,"close")||classie.add(i,"open")}var e=document.getElementById("trigger-overlay"),i=document.querySelector("div.overlay"),t=i.querySelector(".overlay-close");transEndEventNames={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd",msTransition:"MSTransitionEnd",transition:"transitionend"},transEndEventName=transEndEventNames[Modernizr.prefixed("transition")],support={transitions:Modernizr.csstransitions},e.addEventListener("click",n),t.addEventListener("click",n)}();