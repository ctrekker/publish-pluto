(this.webpackJsonpfrontend=this.webpackJsonpfrontend||[]).push([[0],{23:function(e,t,n){},24:function(e,t,n){},25:function(e,t,n){},27:function(e,t,n){},28:function(e,t,n){},34:function(e,t,n){"use strict";n.r(t);var o=n(1),s=n.n(o),c=n(17),i=n.n(c),a=n(8),r=(n(23),n(24),n(11)),l=n(7),h=(n(25),n(0));var u=function(e){var t=e.children;return Object(h.jsx)("section",{className:"PlutoStyle",children:t})};n(27);function j(e){var t=e.style,n=e.className,o=void 0===n?"":n;return Object(h.jsx)("div",{style:Object(r.a)({position:"relative"},t),className:o,children:Object(h.jsx)("div",{className:"spinner"})})}n(28);var b=function(e){var t=e.file,n=e.author,o=e.path,s=e.interactive,c=e.onRemove;return Object(h.jsxs)("div",{className:"Notebook",children:[Object(h.jsxs)("a",{href:"/nb/".concat(o),children:[Object(h.jsxs)("h4",{children:[t,"\xa0\xa0",s?"\u26a1":""]}),Object(h.jsx)("span",{children:n})]}),Object(h.jsx)("div",{style:{flexGrow:1}}),c&&Object(h.jsx)("button",{className:"anti-button",onClick:c,title:"Remove",children:"\u2573"})]})};function d(e){e.props;var t=Object(o.useState)(null),n=Object(l.a)(t,2),s=n[0],c=n[1],i=Object(o.useState)(localStorage.getItem("author")||""),d=Object(l.a)(i,2),x=d[0],p=d[1],f=Object(o.useState)(!1),g=Object(l.a)(f,2),m=g[0],k=g[1],y=Object(o.useState)(!1),v=Object(l.a)(y,2),w=v[0],S=v[1],N=Object(o.useState)(null),P=Object(l.a)(N,2),F=P[0],C=P[1],I=Object(o.useState)(null),A=Object(l.a)(I,2),T=A[0],J=A[1],q=Object(o.useState)(O()),H=Object(l.a)(q,2),R=H[0],D=H[1],G=Object(o.useState)([]),L=Object(l.a)(G,2),U=L[0],E=L[1],M=Object(o.useRef)();return Object(o.useEffect)((function(){fetch("/api/notebooks").then((function(e){return e.json()})).then((function(e){return E(e)})).catch(console.log)}),[R]),Object(h.jsx)("div",{className:"Index-root",children:Object(h.jsxs)(u,{children:[Object(h.jsxs)("section",{children:[Object(h.jsx)("h1",{style:{marginTop:"1.5em"},children:"Publish Pluto!"}),Object(h.jsxs)("p",{children:["Share your Pluto notebooks like never before! Simply drag your notebook file somewhere on this page and we'll do the rest. Interactivity with ",Object(h.jsx)("code",{children:"@bind"})," is supported out-of-the-box."]}),Object(h.jsxs)("p",{children:["If your notebook requires certain external packages see this article for publishing notebooks with ",Object(h.jsx)("a",{href:"",children:"package installation instructions included"}),". Even so certain packages may still fail to work properly, in which case you must also upload a ",Object(h.jsx)(a.b,{to:"/faq#state-files",children:"Pluto state file"})," alongside your notebook file."]})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"\ud83d\udcd3 Upload Your Notebook"}),Object(h.jsxs)("div",{style:{display:s?"none":"block"},children:[Object(h.jsx)("input",{ref:M,type:"file",id:"notebook-upload",hidden:!0,onChange:function(e){c(e.target.value.split(/[/\\]/g).reverse()[0])}}),Object(h.jsx)("label",{htmlFor:"notebook-upload",className:"notebook-upload-label",children:"Click or drag a file here"})]}),s&&Object(h.jsxs)("div",{className:"notebook-placeholder",children:[Object(h.jsxs)("div",{className:"notebook-title",children:[Object(h.jsx)("h3",{children:s}),Object(h.jsx)("input",{type:"text",value:x,readOnly:!(!m&&!w),placeholder:"Add an author...",onChange:function(e){return p(e.target.value)}})]}),Object(h.jsx)("div",{style:{flexGrow:1}}),!m&&!w&&!T&&Object(h.jsxs)(h.Fragment,{children:[Object(h.jsx)("button",{className:"upload-button",onClick:function(){var e=new FormData;e.append("notebook",M.current.files[0]),e.append("author",0===x.length?"Anonymous":x),localStorage.setItem("author",x),k(!0),fetch("/api/notebooks",{method:"POST",body:e}).then((function(e){return e.json()})).then((function(e){C(e),R.unshift(e),function(e){localStorage.setItem("recentUploads",JSON.stringify(e))}(R),D(O()),k(!1),S(!0)})).catch((function(e){console.log(e),k(!1),J(!0)}))},children:"Upload"}),Object(h.jsx)("a",{onClick:function(){c(null),M.current.value=""},title:"Cancel",children:"\u2573"})]}),m&&!w&&Object(h.jsxs)(h.Fragment,{children:[Object(h.jsxs)("span",{style:{margin:"auto 45px auto 0",textAlign:"center"},children:["This may take a while.",Object(h.jsx)("br",{}),Object(h.jsx)("a",{href:"/faq",target:"_blank",children:"Learn More"})]}),Object(h.jsx)(j,{style:{marginRight:15}})]}),w&&Object(h.jsxs)(h.Fragment,{children:[Object(h.jsxs)("span",{style:{margin:"auto 25px auto 0",textAlign:"center"},children:["Your notebook is published!",Object(h.jsx)("br",{}),Object(h.jsx)("a",{href:"/nb/".concat(F.path),children:"See it live"})]}),Object(h.jsx)("button",{onClick:function(){M.current.value="",c(null),S(!1)},children:"Hooray! \ud83c\udf89"})]}),T&&Object(h.jsxs)(h.Fragment,{children:[Object(h.jsx)("span",{style:{margin:"auto 25px auto 0",textAlign:"center"},children:"There was an error. (\u252c\u252c\ufe4f\u252c\u252c)"}),Object(h.jsx)("button",{onClick:function(){J(null)},children:"Go back"})]})]})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"\ud83d\udd25 Notebooks"}),U.length>0&&U.map((function(e){return Object(h.jsx)(b,Object(r.a)({},e),e._id)}))]})]})})}function O(){try{return JSON.parse(localStorage.getItem("recentUploads")||"[]")}catch(e){return[]}}var x=n(2);function p(){return Object(h.jsxs)(u,{children:[Object(h.jsx)("h1",{children:"FAQ"}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"How does this service work?"}),Object(h.jsxs)("p",{children:["At it's core this service simply converts your notebook to an HTML file, then runs it online with ",Object(h.jsx)("a",{href:"https://github.com/JuliaPluto/PlutoSliderServer.jl",children:"PlutoSliderServer.jl"}),". Doing so at large scale and allowing anyone to upload their notebook is where this service distinguishes itself."]})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"How many notebooks can I upload?"}),Object(h.jsx)("p",{children:"For the time being, as many as you want! As demand fluctuates in the future this may or may not remain true, given the strain that processing notebook submissions can have."})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"Can I delete or update existing notebooks?"}),Object(h.jsx)("p",{children:"Not currently, since we have no way to verify you as the original author. Feel free to just submit an updated notebook as a new notebook though."}),Object(h.jsx)("p",{children:"Depending on demand and usage we may implement a user authentication system, which would solve these problems at the cost of an additional step for the user."})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{children:"Why does my notebook have errors?"}),Object(h.jsxs)("p",{children:["Assuming everything works on your local Pluto editor, there are a few things that could be happening. Firstly, if your notebook requires external packages that aren't listed ",Object(h.jsx)(a.b,{to:"/packages",children:"here"}),", you'll need to make a few modifications to your notebook to tell us how to install them."]}),Object(h.jsxs)("p",{children:["References to local files will also not work, meaning you'll have to either include the contents of those files in the notebook somewhere, or download them inside the notebook from a public location such as ",Object(h.jsx)("a",{target:"_blank",href:"https://pages.github.com/",children:"GitHub Pages"}),"."]})]}),Object(h.jsxs)("section",{children:[Object(h.jsx)("h2",{id:"state-files",children:"What are Pluto state files?"}),Object(h.jsx)("p",{children:"Fundamentally a Pluto notebook, unlike a Jupyter notebook, stores no cell outputs. Although this has numerous benefits for file format, it makes publishing services like this one difficult to manage. In order to obtain cell outputs we must run each notebook in a secure and isolated environment, which causes problems for some notebooks. If for whatever reason our service can't run your notebook, you can still publish it by providing us with a file containing cell outputs. This is exactly what a Pluto state file does."}),Object(h.jsxs)("p",{children:["There are a few caveats to this approach though, the main one being we cannot make notebooks interactive if they cannot be run on our service. Viewing features will still work fine, but sliders, text inputs, or any other cell using ",Object(h.jsx)("code",{children:"@bind"})," will not work."]})]})]})}function f(){return Object(h.jsxs)(u,{children:[Object(h.jsx)("h1",{children:"Installed Packages"}),Object(h.jsx)("p",{children:"Check back soon! We haven't compiled the list yet... \ud83d\ude41"})]})}var g=function(){return Object(h.jsx)("div",{className:"App",children:Object(h.jsxs)(x.d,{children:[Object(h.jsx)(x.b,{exact:!0,path:"/",children:Object(h.jsx)(d,{})}),Object(h.jsx)(x.b,{exact:!0,path:"/faq",children:Object(h.jsx)(p,{})}),Object(h.jsx)(x.b,{exact:!0,path:"/packages",children:Object(h.jsx)(f,{})}),Object(h.jsx)(x.a,{to:"/"})]})})},m=function(e){e&&e instanceof Function&&n.e(3).then(n.bind(null,35)).then((function(t){var n=t.getCLS,o=t.getFID,s=t.getFCP,c=t.getLCP,i=t.getTTFB;n(e),o(e),s(e),c(e),i(e)}))};i.a.render(Object(h.jsx)(s.a.StrictMode,{children:Object(h.jsx)(a.a,{children:Object(h.jsx)(g,{})})}),document.getElementById("root")),m()}},[[34,1,2]]]);
//# sourceMappingURL=main.111f01e5.chunk.js.map