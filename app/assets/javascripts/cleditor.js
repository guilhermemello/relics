(function(n){function ii(t){var i=this,a=t.target,p=n.data(a,v),b=l[p],d=b.popupName,nt=e[d],y,g;if(!i.disabled&&n(a).attr(r)!=r){if(y={editor:i,button:a,buttonName:p,popup:nt,popupName:d,command:b.command,useCSS:i.options.useCSS},b.buttonClick&&b.buttonClick(t,y)===!1)return!1;if(p=="source")c(i)?(delete i.range,i.$area.hide(),i.$frame.show(),a.title=b.title):(i.$frame.hide(),i.$area.show(),a.title="Show Rich Text"),setTimeout(function(){h(i)},100);else if(!c(i)){if(d){if(g=n(nt),d=="url"){if(p=="link"&&yt(i)==="")return w(i,"A selection is required when inserting a link.",a),!1;g.children(":button").unbind(f).bind(f,function(){var t=g.find(":text"),r=n.trim(t.val());r!==""&&o(i,y.command,r,null,y.button);t.val("http://");u();s(i)})}else d=="pastetext"&&g.children(":button").unbind(f).bind(f,function(){var n=g.find("textarea"),t=n.val().replace(/\n/g,"<br />");t!==""&&o(i,y.command,t,null,y.button);n.val("");u();s(i)});return a!==n.data(nt,k)?(pt(i,nt,a),!1):void 0}if(p=="print")i.$frame[0].contentWindow.print();else if(!o(i,y.command,y.value,y.useCSS,a))return!1}s(i)}}function st(t){var i=n(t.target).closest("div");i.css(ft,i.data(v)?"#FFF":"#FFC")}function ht(t){n(t.target).closest("div").css(ft,"transparent")}function ri(i){var a=this,y=i.data.popup,r=i.target,h;if(y!==e.msg&&!n(y).hasClass(g)){var w=n.data(y,k),f=n.data(w,v),p=l[f],b=p.command,c,d=a.options.useCSS;if(f=="font"?c=r.style.fontFamily.replace(/"/g,""):f=="size"?(r.tagName.toUpperCase()=="DIV"&&(r=r.children[0]),c=r.innerHTML):f=="style"?c="<"+r.tagName+">":f=="color"?c=at(r.style.backgroundColor):f=="highlight"&&(c=at(r.style.backgroundColor),t?b="backcolor":d=!0),h={editor:a,button:w,buttonName:f,popup:y,popupName:p.popupName,command:b,value:c,useCSS:d},!p.popupClick||p.popupClick(i,h)!==!1){if(h.command&&!o(a,h.command,h.value,h.useCSS,w))return!1;u();s(a)}}}function y(n){for(var t=1,i=0,r=0;r<n.length;++r)t=(t+n.charCodeAt(r))%65521,i=(i+t)%65521;return i<<16|t}function ui(n){n.$area.val("");b(n)}function ct(r,u,f,o,s){var h,c;return e[r]?e[r]:(h=n(i).hide().addClass(li).appendTo("body"),o?h.html(o):r=="color"?(c=u.colors.split(" "),c.length<10&&h.width("auto"),n.each(c,function(t,r){n(i).appendTo(h).css(ft,"#"+r)}),f=ai):r=="font"?n.each(u.fonts.split(","),function(t,r){n(i).appendTo(h).css("fontFamily",r).html(r)}):r=="size"?n.each(u.sizes.split(","),function(t,r){n(i).appendTo(h).html('<font size="'+r+'">'+r+"<\/font>")}):r=="style"?n.each(u.styles,function(t,r){n(i).appendTo(h).html(r[1]+r[0]+r[1].replace("<","<\/"))}):r=="url"?(h.html('Enter URL:<br /><input type="text" value="http://" size="35" /><br /><input type="button" value="Submit" />'),f=g):r=="pastetext"&&(h.html('Paste your content here and click submit.<br /><textarea cols="40" rows="3"><\/textarea><br /><input type="button" value="Submit" />'),f=g),f||o||(f=ni),h.addClass(f),t&&h.attr(et,"on").find("div,font,p,h1,h2,h3,h4,h5,h6").attr(et,"on"),(h.hasClass(ni)||s===!0)&&h.children().hover(st,ht),e[r]=h[0],h[0])}function lt(n,i){i?(n.$area.attr(r,r),n.disabled=!0):(n.$area.removeAttr(r),delete n.disabled);try{t?n.doc.body.contentEditable=!i:n.doc.designMode=i?"off":"on"}catch(u){}h(n)}function o(n,i,r,u,f){p(n);t||((u===undefined||u===null)&&(u=n.options.useCSS),n.doc.execCommand("styleWithCSS",0,u.toString()));var e=!0,o;if(t&&i.toLowerCase()=="inserthtml")a(n).pasteHTML(r);else{try{e=n.doc.execCommand(i,0,r||null)}catch(s){o=s.message;e=!1}e||("cutcopypaste".indexOf(i)>-1?w(n,"For security reasons, your browser does not support the "+i+" command. Try using the keyboard shortcut or context menu instead.",f):w(n,o?o:"Error executing the "+i+" command.",f))}return h(n),rt(n,!0),e}function s(n){setTimeout(function(){c(n)?n.$area.focus():n.$frame[0].contentWindow.focus();h(n)},0)}function a(n){return t?tt(n).createRange():tt(n).getRangeAt(0)}function tt(n){return t?n.doc.selection:n.$frame[0].contentWindow.getSelection()}function at(n){var i=/rgba?\((\d+), (\d+), (\d+)/.exec(n),t;if(i){for(n=(i[1]<<16|i[2]<<8|i[3]).toString(16);n.length<6;)n="0"+n;return"#"+n}return(t=n.split(""),n.length==4)?"#"+t[1]+t[1]+t[2]+t[2]+t[3]+t[3]:n}function u(){n.each(e,function(t,i){n(i).hide().unbind(f).removeData(k)})}function vt(){var t=n("link[href*=cleditor]").attr("href");return t.replace(/^(.*\/)[^\/]+$/,"$1")+"images/"}function fi(n){return"url("+vt()+n+")"}function it(i){var o=i.$main,r=i.options;i.$frame&&i.$frame.remove();var f=i.$frame=n('<iframe frameborder="0" src="javascript:true;" />').hide().appendTo(o),l=f[0].contentWindow,e=i.doc=l.document,c=n(e);e.open();e.write(r.docType+"<html>"+(r.docCSSFile===""?"":'<head><link rel="stylesheet" type="text/css" href="'+r.docCSSFile+'" /><\/head>')+'<body style="'+r.bodyStyle+'"><\/body><\/html>');e.close();t&&c.click(function(){s(i)});b(i);t&&(c.bind("beforedeactivate beforeactivate selectionchange keypress",function(n){if(n.type=="beforedeactivate")i.inactive=!0;else if(n.type=="beforeactivate")!i.inactive&&i.range&&i.range.length>1&&i.range.shift(),delete i.inactive;else if(!i.inactive)for(i.range||(i.range=[]),i.range.unshift(a(i));i.range.length>2;)i.range.pop()}),f.focus(function(){p(i)}));c.click(u).bind("keyup mouseup",function(){h(i);rt(i,!0)});ot?i.$area.show():f.show();n(function(){var t=i.$toolbar,u=t.children("div:last"),e=o.width(),n=u.offset().top+u.outerHeight()-t.offset().top+1;t.height(n);n=(/%/.test(""+r.height)?o.height():parseInt(r.height))-n;f.width(e).height(n);i.$area.width(e).height(yi?n-2:n);lt(i,i.disabled);h(i)})}function h(i){var u,f;ot||!pi||i.focused||(i.$frame[0].contentWindow.focus(),window.focus(),i.focused=!0);u=i.doc;t&&(u=a(i));f=c(i);n.each(i.$toolbar.find("."+dt),function(o,s){var a=n(s),h=n.cleditor.buttons[n.data(s,v)],c=h.command,l=!0,y;if(i.disabled)l=!1;else if(h.getEnabled)y={editor:i,button:s,buttonName:h.name,popup:e[h.popupName],popupName:h.popupName,command:h.command,useCSS:i.options.useCSS},l=h.getEnabled(y),l===undefined&&(l=!0);else if((f||ot)&&h.name!="source"||t&&(c=="undo"||c=="redo"))l=!1;else if(c&&c!="print"&&(t&&c=="hilitecolor"&&(c="backcolor"),!t||c!="inserthtml"))try{l=u.queryCommandEnabled(c)}catch(p){l=!1}l?(a.removeClass(gt),a.removeAttr(r)):(a.addClass(gt),a.attr(r,r))})}function p(n){t&&n.range&&n.range[0].select()}function ei(n){setTimeout(function(){c(n)?n.$area.select():o(n,"selectall")},0)}function oi(i){var u,r,f;return(p(i),u=a(i),t)?u.htmlText:(r=n("<layer>")[0],r.appendChild(u.cloneContents()),f=r.innerHTML,r=null,f)}function yt(n){return(p(n),t)?a(n).text:tt(n).toString()}function w(n,t,i){var r=ct("msg",n.options,vi);r.innerHTML=t;pt(n,r,i)}function pt(t,i,r){var e,h,c,o=n(i),l,s;r?(l=n(r),e=l.offset(),h=--e.left,c=e.top+l.height()):(s=t.$toolbar,e=s.offset(),h=Math.floor((s.width()-o.width())/2)+e.left,c=e.top+s.height()-2);u();o.css({left:h,top:c}).show();r&&(n.data(i,k,r),o.bind(f,{popup:i},n.proxy(ri,t)));setTimeout(function(){o.find(":text,textarea").eq(0).focus().select()},100)}function c(n){return n.$area.is(":visible")}function b(t,i){var u=t.$area.val(),o=t.options,f=o.updateFrame,s=n(t.doc.body),e,r;if(f){if(e=y(u),i&&t.areaChecksum==e)return;t.areaChecksum=e}r=f?f(u):u;r=r.replace(/<(?=\/?script)/ig,"&lt;");o.updateTextArea&&(t.frameChecksum=y(r));r!=s.html()&&(s.html(r),n(t).triggerHandler(d))}function rt(t,i){var u=n(t.doc.body).html(),o=t.options,f=o.updateTextArea,s=t.$area,e,r;if(f){if(e=y(u),i&&t.frameChecksum==e)return;t.frameChecksum=e}r=f?f(u):u;o.updateFrame&&(t.areaChecksum=y(r));r!=s.val()&&(s.val(r),n(t).triggerHandler(d))}var ut,wt;n.cleditor={defaultOptions:{width:"auto",height:250,controls:"bold italic underline strikethrough subscript superscript | font size style | color highlight removeformat | bullets numbering | outdent indent | alignleft center alignright justify | undo redo | rule image link unlink | cut copy paste pastetext | print source",colors:"FFF FCC FC9 FF9 FFC 9F9 9FF CFF CCF FCF CCC F66 F96 FF6 FF3 6F9 3FF 6FF 99F F9F BBB F00 F90 FC6 FF0 3F3 6CC 3CF 66C C6C 999 C00 F60 FC3 FC0 3C0 0CC 36F 63F C3C 666 900 C60 C93 990 090 399 33F 60C 939 333 600 930 963 660 060 366 009 339 636 000 300 630 633 330 030 033 006 309 303",fonts:"Arial,Arial Black,Comic Sans MS,Courier New,Narrow,Garamond,Georgia,Impact,Sans Serif,Serif,Tahoma,Trebuchet MS,Verdana",sizes:"1,2,3,4,5,6,7",styles:[["Paragraph","<p>"],["Header 1","<h1>"],["Header 2","<h2>"],["Header 3","<h3>"],["Header 4","<h4>"],["Header 5","<h5>"],["Header 6","<h6>"]],useCSS:!0,docType:'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">',docCSSFile:"",bodyStyle:"margin:4px; font:10pt Arial,Verdana; cursor:text"},buttons:{init:"bold,,|italic,,|underline,,|strikethrough,,|subscript,,|superscript,,|font,,fontname,|size,Font Size,fontsize,|style,,formatblock,|color,Font Color,forecolor,|highlight,Text Highlight Color,hilitecolor,color|removeformat,Remove Formatting,|bullets,,insertunorderedlist|numbering,,insertorderedlist|outdent,,|indent,,|alignleft,Align Text Left,justifyleft|center,,justifycenter|alignright,Align Text Right,justifyright|justify,,justifyfull|undo,,|redo,,|rule,Insert Horizontal Rule,inserthorizontalrule|image,Insert Image,insertimage,url|link,Insert Hyperlink,createlink,url|unlink,Remove Hyperlink,|cut,,|copy,,|paste,,|pastetext,Paste as Text,inserthtml,|print,,|source,Show Source"},imagesPath:function(){return vt()}};n.fn.cleditor=function(t){var i=n([]);return this.each(function(r,u){if(u.tagName.toUpperCase()=="TEXTAREA"){var f=n.data(u,bt);f||(f=new cleditor(u,t));i=i.add(f)}}),i};var ft="backgroundColor",k="button",v="buttonName",d="change",bt="cleditor",f="click",r="disabled",i="<div>",et="unselectable",si="cleditorMain",hi="cleditorToolbar",kt="cleditorGroup",dt="cleditorButton",gt="cleditorDisabled",ci="cleditorDivider",li="cleditorPopup",ni="cleditorList",ai="cleditorColor",g="cleditorPrompt",vi="cleditorMsg",nt=navigator.userAgent.toLowerCase(),t=/msie/.test(nt),yi=/msie\s6/.test(nt),pi=/webkit/.test(nt),ot=/iphone|ipad|ipod/i.test(nt),e={},ti,l=n.cleditor.buttons;n.each(l.init.split("|"),function(n,t){var i=t.split(","),r=i[0];l[r]={stripIndex:n,name:r,title:i[1]===""?r.charAt(0).toUpperCase()+r.substr(1):i[1],command:i[2]===""?r:i[2],popupName:i[3]===""?r:i[3]}});delete l.init;cleditor=function(r,e){var o=this;o.options=e=n.extend({},n.cleditor.defaultOptions,e);var c=o.$area=n(r).hide().data(bt,o).blur(function(){b(o,!0)}),a=o.$main=n(i).addClass(si).width(e.width).height(e.height),y=o.$toolbar=n(i).addClass(hi).appendTo(a),s=n(i).addClass(kt).appendTo(y),h=0;n.each(e.controls.split(" "),function(r,u){var w,c,p,a;if(u==="")return!0;u=="|"?(w=n(i).addClass(ci).appendTo(s),s.width(h+1),h=0,s=n(i).addClass(kt).appendTo(y)):(c=l[u],p=n(i).data(v,c.name).addClass(dt).attr("title",c.title).bind(f,n.proxy(ii,o)).appendTo(s).hover(st,ht),h+=24,s.width(h+1),a={},c.css?a=c.css:c.image&&(a.backgroundImage=fi(c.image)),c.stripIndex&&(a.backgroundPosition=c.stripIndex*-24),p.css(a),t&&p.attr(et,"on"),c.popupName&&ct(c.popupName,e,c.popupClass,c.popupContent,c.popupHover))});a.insertBefore(c).append(c);ti||(n(document).click(function(t){var i=n(t.target);i.add(i.parents()).is("."+g)||u()}),ti=!0);/auto|%/.test(""+e.width+e.height)&&n(window).bind("resize.cleditor",function(){it(o)});it(o)};ut=cleditor.prototype;wt=[["clear",ui],["disable",lt],["execCommand",o],["focus",s],["hidePopups",u],["sourceMode",c,!0],["refresh",it],["select",ei],["selectedHTML",oi,!0],["selectedText",yt,!0],["showMessage",w],["updateFrame",b],["updateTextArea",rt]];n.each(wt,function(n,t){ut[t[0]]=function(){for(var n=this,r=[n],u,i=0;i<arguments.length;i++)r.push(arguments[i]);return(u=t[1].apply(n,r),t[2])?u:n}});ut.change=function(t){var i=n(this);return t?i.bind(d,t):i.trigger(d)}})(jQuery);!function(){var n=null;window.PR_SHOULD_USE_CONTINUATION=!0,function(){function d(n){function e(n){var i=n.charCodeAt(0),t;return i!==92?i:(t=n.charAt(1),(i=a[t])?i:"0"<=t&&t<="7"?parseInt(n.substring(1),8):t==="u"||t==="x"?parseInt(n.substring(2),16):n.charCodeAt(1))}function r(n){return n<32?(n<16?"\\x0":"\\x")+n.toString(16):(n=String.fromCharCode(n),n==="\\"||n==="-"||n==="]"||n==="^"?"\\"+n:n)}function h(n){var u=n.substring(1,n.length-1).match(/\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\[0-3][0-7]{0,2}|\\[0-7]{1,2}|\\[\S\s]|[^\\]/g),n=[],i=u[0]==="^",s=["["],f,t,o;for(i&&s.push("^"),i=i?1:0,f=u.length;i<f;++i)t=u[i],/\\[bdsw]/i.test(t)?s.push(t):(t=e(t),i+2<f&&"-"===u[i+1]?(o=e(u[i+2]),i+=2):o=t,n.push([t,o]),o<65||t>122||(o<65||t>90||n.push([Math.max(65,t)|32,Math.min(o,90)|32]),o<97||t>122||n.push([Math.max(97,t)&-33,Math.min(o,122)&-33])));for(n.sort(function(n,t){return n[0]-t[0]||t[1]-n[1]}),u=[],f=[],i=0;i<n.length;++i)t=n[i],t[0]<=f[1]+1?f[1]=Math.max(f[1],t[1]):u.push(f=t);for(i=0;i<u.length;++i)t=u[i],s.push(r(t[0])),t[1]>t[0]&&(t[1]+1>t[0]&&s.push("-"),s.push(r(t[1])));return s.push("]"),s.join("")}function c(n){for(var i,u=n.source.match(/\[(?:[^\\\]]|\\[\S\s])*]|\\u[\dA-Fa-f]{4}|\\x[\dA-Fa-f]{2}|\\\d+|\\[^\dux]|\(\?[!:=]|[()^]|[^()[\\^]+/g),s=u.length,f=[],t=0,e=0;t<s;++t)i=u[t],i==="("?++e:"\\"===i.charAt(0)&&(i=+i.substring(1))&&(i<=e?f[i]=-1:u[t]=r(i));for(t=1;t<f.length;++t)-1===f[t]&&(f[t]=++l);for(e=t=0;t<s;++t)i=u[t],i==="("?(++e,f[e]||(u[t]="(?:")):"\\"===i.charAt(0)&&(i=+i.substring(1))&&i<=e&&(u[t]="\\"+f[i]);for(t=0;t<s;++t)"^"===u[t]&&"^"!==u[t+1]&&(u[t]="");if(n.ignoreCase&&o)for(t=0;t<s;++t)i=u[t],n=i.charAt(0),i.length>=2&&n==="["?u[t]=h(i):n!=="\\"&&(u[t]=i.replace(/[A-Za-z]/g,function(n){return n=n.charCodeAt(0),"["+String.fromCharCode(n&-33,n|32)+"]"}));return u.join("")}for(var t,l=0,o=!1,u=!1,i=0,f=n.length;i<f;++i)if(t=n[i],t.ignoreCase)u=!0;else if(/[a-z]/i.test(t.source.replace(/\\u[\da-f]{4}|\\x[\da-f]{2}|\\[^UXux]/gi,""))){o=!0;u=!1;break}for(var a={b:8,t:9,n:10,v:11,f:12,r:13},s=[],i=0,f=n.length;i<f;++i){if(t=n[i],t.global||t.multiline)throw Error(""+t);s.push("(?:"+c(t)+")")}return RegExp(s.join("|"),u?"gi":"g")}function g(n,t){function e(n){var s=n.nodeType;if(s==1){if(!o.test(n.className)){for(s=n.firstChild;s;s=s.nextSibling)e(s);s=n.nodeName.toLowerCase();("br"===s||"li"===s)&&(u[i]="\n",r[i<<1]=f++,r[i++<<1|1]=n)}}else(s==3||s==4)&&(s=n.nodeValue,s.length&&(s=t?s.replace(/\r\n?/g,"\n"):s.replace(/[\t\n\r ]+/g," "),u[i]=s,r[i<<1]=f,f+=s.length,r[i++<<1|1]=n))}var o=/(?:^|\s)nocode(?:\s|$)/,u=[],f=0,r=[],i=0;return e(n),{a:u.join("").replace(/\n$/,""),d:r}}function s(n,t,i,r){t&&(n={a:t,e:n},i(n),r.push.apply(r,n.g))}function nt(n){for(var r,t=void 0,i=n.firstChild;i;i=i.nextSibling)r=i.nodeType,t=r===1?t?n:i:r===3?it.test(i.nodeValue)?n:t:t;if(t!==n)return t}function u(t,i){function r(n){for(var h,p,w,v=n.e,y=[v,"pln"],k=0,d=n.a.match(f)||[],g={},b=0,nt=d.length;b<nt;++b){var l=d[b],o=g[l],a=void 0,t;if(typeof o=="string")t=!1;else{if(h=u[l.charAt(0)],h)a=l.match(h[1]),o=h[0];else{for(t=0;t<e;++t)if(h=i[t],a=l.match(h[1])){o=h[0];break}a||(o="pln")}!(t=o.length>=5&&"lang-"===o.substring(0,5))||a&&typeof a[1]=="string"||(t=!1,o="src");t||(g[l]=o)}h=k;k+=l.length;t?(t=a[1],p=l.indexOf(t),w=p+t.length,a[2]&&(w=l.length-a[2].length,p=w-t.length),o=o.substring(5),s(v+h,l.substring(0,p),r,y),s(v+h+p,t,c(o,t),y),s(v+h+w,l.substring(w),r,y)):y.push(v+h,o)}n.g=y}var u={},f,e;return function(){for(var r,e,h,c=t.concat(i),o=[],l={},s=0,a=c.length;s<a;++s){if(r=c[s],e=r[3],e)for(h=e.length;--h>=0;)u[e.charAt(h)]=r;r=r[1];e=""+r;l.hasOwnProperty(e)||(o.push(r),l[e]=n)}o.push(/[\S\s]/);f=d(o)}(),e=i.length,r}function i(t){var f=[],r=[],i,e;return t.tripleQuotedStrings?f.push(["str",/^(?:'''(?:[^'\\]|\\[\S\s]|''?(?=[^']))*(?:'''|$)|"""(?:[^"\\]|\\[\S\s]|""?(?=[^"]))*(?:"""|$)|'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$))/,n,"'\""]):t.multiLineStrings?f.push(["str",/^(?:'(?:[^'\\]|\\[\S\s])*(?:'|$)|"(?:[^"\\]|\\[\S\s])*(?:"|$)|`(?:[^\\`]|\\[\S\s])*(?:`|$))/,n,"'\"`"]):f.push(["str",/^(?:'(?:[^\n\r'\\]|\\.)*(?:'|$)|"(?:[^\n\r"\\]|\\.)*(?:"|$))/,n,"\"'"]),t.verbatimStrings&&r.push(["str",/^@"(?:[^"]|"")*(?:"|$)/,n]),i=t.hashComments,i&&(t.cStyleComments?(i>1?f.push(["com",/^#(?:##(?:[^#]|#(?!##))*(?:###|$)|.*)/,n,"#"]):f.push(["com",/^#(?:(?:define|e(?:l|nd)if|else|error|ifn?def|include|line|pragma|undef|warning)\b|[^\n\r]*)/,n,"#"]),r.push(["str",/^<(?:(?:(?:\.\.\/)*|\/?)(?:[\w-]+(?:\/[\w-]+)+)?[\w-]+\.h(?:h|pp|\+\+)?|[a-z]\w*)>/,n])):f.push(["com",/^#[^\n\r]*/,n,"#"])),t.cStyleComments&&(r.push(["com",/^\/\/[^\n\r]*/,n]),r.push(["com",/^\/\*[\S\s]*?(?:\*\/|$)/,n])),(i=t.regexLiterals)&&(e=(i=i>1?"":"\n\r")?".":"[\\S\\s]",r.push(["lang-regex",RegExp("^(?:^^\\.?|[+-]|[!=]=?=?|\\#|%=?|&&?=?|\\(|\\*=?|[+\\-]=|->|\\/=?|::?|<<?=?|>>?>?=?|,|;|\\?|@|\\[|~|{|\\^\\^?=?|\\|\\|?=?|break|case|continue|delete|do|else|finally|instanceof|return|throw|try|typeof)\\s*("+("/(?=[^/*"+i+"])(?:[^/\\x5B\\x5C"+i+"]|\\x5C"+e+"|\\x5B(?:[^\\x5C\\x5D"+i+"]|\\x5C"+e+")*(?:\\x5D|$))+/")+")")])),(i=t.types)&&r.push(["typ",i]),i=(""+t.keywords).replace(/^ | $/g,""),i.length&&r.push(["kwd",RegExp("^(?:"+i.replace(/[\s,]+/g,"|")+")\\b"),n]),f.push(["pln",/^\s+/,n," \r\n\t "]),i="^.[^\\s\\w.$@'\"`/\\\\]*",t.regexLiterals&&(i+="(?!s*/)"),r.push(["lit",/^@[$_a-z][\w$@]*/i,n],["typ",/^(?:[@_]?[A-Z]+[a-z][\w$@]*|\w+_t\b)/,n],["pln",/^[$_a-z][\w$@]*/i,n],["lit",/^(?:0x[\da-f]+|(?:\d(?:_\d+)*\d*(?:\.\d*)?|\.\d\+)(?:e[+-]?\d+)?)[a-z]*/i,n,"0123456789"],["pln",/^\\[\S\s]?/,n],["pun",RegExp(i),n]),u(f,r)}function h(n,t,i){function s(n){var t=n.nodeType,r,u;if(t!=1||c.test(n.className))(t==3||t==4)&&i&&(r=n.nodeValue,u=r.match(l),u&&(t=r.substring(0,u.index),n.nodeValue=t,(r=r.substring(u.index+u[0].length))&&n.parentNode.insertBefore(e.createTextNode(r),n.nextSibling),h(n),t||n.parentNode.removeChild(n)));else if("br"===n.nodeName)h(n),n.parentNode&&n.parentNode.removeChild(n);else for(n=n.firstChild;n;n=n.nextSibling)s(n)}function h(n){function i(n,t){var e=t?n.cloneNode(!1):n,r=n.parentNode,f,u;if(r)for(r=i(r,1),f=n.nextSibling,r.appendChild(e),u=f;u;u=f)f=u.nextSibling,r.appendChild(u);return e}for(;!n.nextSibling;)if(n=n.parentNode,!n)return;for(var n=i(n.nextSibling,0),t;(t=n.parentNode)&&t.nodeType===1;)n=t;f.push(n)}for(var f,r,o,c=/(?:^|\s)nocode(?:\s|$)/,l=/\r\n?|\n/,e=n.ownerDocument,u=e.createElement("li");n.firstChild;)u.appendChild(n.firstChild);for(f=[u],r=0;r<f.length;++r)s(f[r]);t===(t|0)&&f[0].setAttribute("value",t);o=e.createElement("ol");o.className="linenums";for(var t=Math.max(0,t-1|0)||0,r=0,a=f.length;r<a;++r)u=f[r],u.className="L"+(r+t)%10,u.firstChild||u.appendChild(e.createTextNode(" ")),o.appendChild(u);n.appendChild(o)}function t(n,t){for(var i,r=t.length;--r>=0;)i=t[r],o.hasOwnProperty(i)?f.console&&console.warn("cannot override language handler %s",i):o[i]=n}function c(n,t){return n&&o.hasOwnProperty(n)||(n=/^\s*</.test(t)?"default-markup":"default-code"),o[n]}function l(n){var b=n.h,r,u,e,i,h,ft,tt,a,it;try{r=g(n.c,n.i);u=r.a;n.a=u;n.d=r.d;n.e=0;c(b,u)(n);var v=/\bMSIE\s(\d+)/.exec(navigator.userAgent),v=v&&+v[1]<=8,b=/\n/g,k=n.a,d=k.length,r=0,y=n.d,ot=y.length,u=0,t=n.g,l=t.length,nt=0;for(t[l]=d,i=e=0;i<l;)t[i]!==t[i+2]?(t[e++]=t[i++],t[e++]=t[i++]):i+=2;for(l=e,i=e=0;i<l;){for(var st=t[i],ut=t[i+1],o=i+2;o+2<=l&&t[o+1]===ut;)o+=2;t[e++]=st;t[e++]=ut;i=o}t.length=e;h=n.c;h&&(ft=h.style.display,h.style.display="none");try{for(;u<ot;){var p=y[u+2]||d,et=t[nt+2]||d,o=Math.min(p,et),s=y[u+1],w;s.nodeType!==1&&(w=k.substring(r,o))&&(v&&(w=w.replace(b,"\r")),s.nodeValue=w,tt=s.ownerDocument,a=tt.createElement("span"),a.className=t[nt+1],it=s.parentNode,it.replaceChild(a,s),a.appendChild(s),r<p&&(y[u+1]=s=tt.createTextNode(k.substring(o,p)),it.insertBefore(s,a.nextSibling)));r=o;r>=p&&(u+=2);r>=et&&(nt+=2)}}finally{h&&(h.style.display=ft)}}catch(rt){f.console&&console.log(rt&&rt.stack||rt)}}var f=window,r=["break,continue,do,else,for,if,return,while"],e=[[r,"auto,case,char,const,default,double,enum,extern,float,goto,inline,int,long,register,short,signed,sizeof,static,struct,switch,typedef,union,unsigned,void,volatile"],"catch,class,delete,false,import,new,operator,private,protected,public,this,throw,true,try,typeof"],a=[e,"alignof,align_union,asm,axiom,bool,concept,concept_map,const_cast,constexpr,decltype,delegate,dynamic_cast,explicit,export,friend,generic,late_check,mutable,namespace,nullptr,property,reinterpret_cast,static_assert,static_cast,template,typeid,typename,using,virtual,where"],v=[e,"abstract,assert,boolean,byte,extends,final,finally,implements,import,instanceof,interface,null,native,package,strictfp,super,synchronized,throws,transient"],y=[v,"as,base,by,checked,decimal,delegate,descending,dynamic,event,fixed,foreach,from,group,implicit,in,internal,into,is,let,lock,object,out,override,orderby,params,partial,readonly,ref,sbyte,sealed,stackalloc,string,select,uint,ulong,unchecked,unsafe,ushort,var,virtual,where"],e=[e,"debugger,eval,export,function,get,null,set,undefined,var,with,Infinity,NaN"],p=[r,"and,as,assert,class,def,del,elif,except,exec,finally,from,global,import,in,is,lambda,nonlocal,not,or,pass,print,raise,try,with,yield,False,True,None"],w=[r,"alias,and,begin,case,class,def,defined,elsif,end,ensure,false,in,module,next,nil,not,or,redo,rescue,retry,self,super,then,true,undef,unless,until,when,yield,BEGIN,END"],tt=[r,"as,assert,const,copy,drop,enum,extern,fail,false,fn,impl,let,log,loop,match,mod,move,mut,priv,pub,pure,ref,self,static,struct,true,trait,type,unsafe,use"],r=[r,"case,done,elif,esac,eval,fi,function,in,local,set,then,until"],b=/^(DIR|FILE|vector|(de|priority_)?queue|list|stack|(const_)?iterator|(multi)?(set|map)|bitset|u?(int|float)\d*)\b/,it=/\S/,rt=i({keywords:[a,y,e,"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END",p,w,r],hashComments:!0,cStyleComments:!0,multiLineStrings:!0,regexLiterals:!0}),o={},k;t(rt,["default-code"]);t(u([],[["pln",/^[^<?]+/],["dec",/^<!\w[^>]*(?:>|$)/],["com",/^<\!--[\S\s]*?(?:--\>|$)/],["lang-",/^<\?([\S\s]+?)(?:\?>|$)/],["lang-",/^<%([\S\s]+?)(?:%>|$)/],["pun",/^(?:<[%?]|[%?]>)/],["lang-",/^<xmp\b[^>]*>([\S\s]+?)<\/xmp\b[^>]*>/i],["lang-js",/^<script\b[^>]*>([\S\s]*?)(<\/script\b[^>]*>)/i],["lang-css",/^<style\b[^>]*>([\S\s]*?)(<\/style\b[^>]*>)/i],["lang-in.tag",/^(<\/?[a-z][^<>]*>)/i]]),["default-markup","htm","html","mxml","xhtml","xml","xsl"]);t(u([["pln",/^\s+/,n," \t\r\n"],["atv",/^(?:"[^"]*"?|'[^']*'?)/,n,"\"'"]],[["tag",/^^<\/?[a-z](?:[\w-.:]*\w)?|\/?>$/i],["atn",/^(?!style[\s=]|on)[a-z](?:[\w:-]*\w)?/i],["lang-uq.val",/^=\s*([^\s"'>]*(?:[^\s"'/>]|\/(?=\s)))/],["pun",/^[/<->]+/],["lang-js",/^on\w+\s*=\s*"([^"]+)"/i],["lang-js",/^on\w+\s*=\s*'([^']+)'/i],["lang-js",/^on\w+\s*=\s*([^\s"'>]+)/i],["lang-css",/^style\s*=\s*"([^"]+)"/i],["lang-css",/^style\s*=\s*'([^']+)'/i],["lang-css",/^style\s*=\s*([^\s"'>]+)/i]]),["in.tag"]);t(u([],[["atv",/^[\S\s]+/]]),["uq.val"]);t(i({keywords:a,hashComments:!0,cStyleComments:!0,types:b}),["c","cc","cpp","cxx","cyc","m"]);t(i({keywords:"null,true,false"}),["json"]);t(i({keywords:y,hashComments:!0,cStyleComments:!0,verbatimStrings:!0,types:b}),["cs"]);t(i({keywords:v,cStyleComments:!0}),["java"]);t(i({keywords:r,hashComments:!0,multiLineStrings:!0}),["bash","bsh","csh","sh"]);t(i({keywords:p,hashComments:!0,multiLineStrings:!0,tripleQuotedStrings:!0}),["cv","py","python"]);t(i({keywords:"caller,delete,die,do,dump,elsif,eval,exit,foreach,for,goto,if,import,last,local,my,next,no,our,print,package,redo,require,sub,undef,unless,until,use,wantarray,while,BEGIN,END",hashComments:!0,multiLineStrings:!0,regexLiterals:2}),["perl","pl","pm"]);t(i({keywords:w,hashComments:!0,multiLineStrings:!0,regexLiterals:!0}),["rb","ruby"]);t(i({keywords:e,cStyleComments:!0,regexLiterals:!0}),["javascript","js"]);t(i({keywords:"all,and,by,catch,class,else,extends,false,finally,for,if,in,is,isnt,loop,new,no,not,null,of,off,on,or,return,super,then,throw,true,try,unless,until,when,while,yes",hashComments:3,cStyleComments:!0,multilineStrings:!0,tripleQuotedStrings:!0,regexLiterals:!0}),["coffee"]);t(i({keywords:tt,cStyleComments:!0,multilineStrings:!0}),["rc","rs","rust"]);t(u([],[["str",/^[\S\s]+/]]),["regex"]);k=f.PR={createSimpleLexer:u,registerLangHandler:t,sourceDecorator:i,PR_ATTRIB_NAME:"atn",PR_ATTRIB_VALUE:"atv",PR_COMMENT:"com",PR_DECLARATION:"dec",PR_KEYWORD:"kwd",PR_LITERAL:"lit",PR_NOCODE:"nocode",PR_PLAIN:"pln",PR_PUNCTUATION:"pun",PR_SOURCE:"src",PR_STRING:"str",PR_TAG:"tag",PR_TYPE:"typ",prettyPrintOne:f.prettyPrintOne=function(n,t,i){var r=document.createElement("div");return r.innerHTML="<pre>"+n+"<\/pre>",r=r.firstChild,i&&h(r,i,!0),l({h:t,j:i,c:r,i:1}),r.innerHTML},prettyPrint:f.prettyPrint=function(t,i){function a(){for(var i,r,ut,ft=f.PR_SHOULD_USE_CONTINUATION?u.now()+250:Infinity;c<e.length&&u.now()<ft;c++){for(var s=e[c],rt=b,v=s;v=v.previousSibling;){if(r=v.nodeType,i=(r===7||r===8)&&v.nodeValue,i?!/^\??prettify\b/.test(i):r!==3||/\S/.test(v.nodeValue))break;if(i){rt={};i.replace(/\b(\w+)=([\w%+\-.:]+)/g,function(n,t,i){rt[t]=i});break}}if(v=s.className,(rt!==b||w.test(v))&&!d.test(v)){for(r=!1,i=s.parentNode;i;i=i.parentNode)if(it.test(i.tagName)&&i.className&&w.test(i.className)){r=!0;break}if(!r){if(s.className+=" prettyprinted",r=rt.lang,r||(r=v.match(p),!r&&(ut=nt(s))&&tt.test(ut.tagName)&&(r=ut.className.match(p)),r&&(r=r[1])),g.test(s.tagName))i=1;else var i=s.currentStyle,o=k.defaultView,i=(i=i?i.whiteSpace:o&&o.getComputedStyle?o.getComputedStyle(s,n).getPropertyValue("white-space"):0)&&"pre"===i.substring(0,3);o=rt.linenums;(o=o==="true"||+o)||(o=(o=v.match(/\blinenums\b(?::(\d+))?/))?o[1]&&o[1].length?+o[1]:!0:!1);o&&h(s,o,i);y={h:r,c:s,j:o,i:i};l(y)}}}c<e.length?setTimeout(a,250):"function"==typeof t&&t()}for(var s,v,u,r=i||document.body,k=r.ownerDocument||document,r=[r.getElementsByTagName("pre"),r.getElementsByTagName("code"),r.getElementsByTagName("xmp")],e=[],o=0;o<r.length;++o)for(s=0,v=r[o].length;s<v;++s)e.push(r[o][s]);r=n;u=Date;u.now||(u={now:function(){return+new Date}});var c=0,y,p=/\blang(?:uage)?-([\w.]+)(?!\S)/,w=/\bprettyprint\b/,d=/\bprettyprinted\b/,g=/pre|xmp/i,tt=/^code$/i,it=/^(?:pre|code|xmp)$/i,b={};a()}};typeof define=="function"&&define.amd&&define("google-code-prettify",[],function(){return k})}()}();$(function(){prettyPrint()})