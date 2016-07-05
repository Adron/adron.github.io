---
title: TypeScript up in my WebStorm - TypeScript Editor Shootout @ TypeScriptPDX
author: Adron Hall
date: 2016-07-04:21:47:07
template: talk.jade
---
## TypeScript up in my WebStorm
### *@ TypeScriptPDX*

Recently I joined a panel focused on TypeScript and a shootout between editors that have some pretty sweet TypeScript feature. Here is a wrap up of key features around WebStorm and the TypeScript.

A quick definition of TypeScript from the <a href="http://www.typescriptlang.org/" target="_blank">TypeScript Site</a>. If you're interested in the spec of the language, <a href="http://www.typescriptlang.org/Content/TypeScript%20Language%20Specification.pdf" target="_blank">check this out</a>.
<blockquote>TypeScript is a typed superset of JavaScript that compiles to plain JavaScript. Any browser. Any host. Any OS. Open Source. TypeScript offers classes, modules, and interfaces to help you build robust components. These features are available at development time for high-confidence application development, but are compiled into simple JavaScript. TypeScript types let you define interfaces between software components and to gain insight into the behavior of existing JavaScript libraries.</blockquote>
<a href="https://compositecode.files.wordpress.com/2015/07/webstorm.png"><img class="alignright size-full wp-image-11375" src="https://compositecode.files.wordpress.com/2015/07/webstorm.png" alt="" width="128" height="128" /></a>Ok, so now, in case you didn't already, you have an idea of what TypeScript is. If you're unaware of what <a href="https://www.jetbrains.com/webstorm/" target="_blank">WebStorm</a> is, here's the lowdown on the IDE and a few of the other - not particularly TypeScript related features - directly from the <a href="http://WebStorm is a lightweight yet powerful IDE, perfectly equipped for complex client-side development and server-side development with Node.js." target="_blank">WebStorm Site</a>.
<blockquote>WebStorm is a lightweight yet powerful IDE, perfectly equipped for complex client-side development and server-side development with Node.js. Enjoy smart code autocompletion for JavaScript keywords, variables, methods, functions and parameters! WebStorm provides complex code quality analysis for your JavaScript code. On-the-fly error detection and quick-fix options will make the development process more efficient and ensure better code quality - In addition to dozens of built-in inspections, you can use integrated JSHint, ESLint, JSCS, JSLint and Google Closure Linter code quality tools. Smart refactorings for JavaScript will help you keep your code clean and safe:
<ul>
	<li>Rename a file, function, variable or parameter everywhere in the project.</li>
	<li>Extract variable or function: create a new variable or a function from a selected piece of code.</li>
	<li>Inline Variable or Function: replace a variable usage(s) with its definition, or replace a function call(s) with its body.</li>
	<li>Move/Copy file and Safe Delete file.</li>
	<li>Extract inlined script from HTML into a JavaScript file.</li>
	<li>Surround with and Unwrap code statements.</li>
</ul>
</blockquote>
...and seriously, that's only the tip of the iceberg. There is a TON of other features that WebStorm has. But just check out the site and you'll see, I don't need to sell it to you. On to the TypeScript features that I discussed last night at the editor shootout!
<h3>Versions</h3>
WebStorm 10 offers support for TypeScript 1.4 and 1.5. This support is basically enabled out of the box. The minute that you launch WebStorm you will see TypeScript features available. This is the version that was included in the shootout for discussion on the panel at the TypeScript Editor Shootout <a href="http://twitter.com/typescriptpdx" target="_blank">@TypeScriptPDX</a>.
<h3>My Two Cents - i.e. My Favorite TypeScript Features in WebStorm</h3>
To see the full shootout, you'd have to have come to the TypeScript PDX meetup. But here's the key features that I enjoy in my day-to-day coding the most.

<strong>TypeScript Transpiling</strong>

First and foremost is the fact that WebStorm builds the TypeScript code files automatically the second you create them. The way to insure this is turned on is very simple and there are two avenues. One is to navigate into settings and turn it on in the TypeScript settings screen.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-GwSdhrT/0/O/typescript-feature-02.png"><img class="" src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-GwSdhrT/0/L/typescript-feature-02-L.png" alt="TypeScript Settings / Transpiler Settings (Click for full size image)" width="800" height="522" /></a> TypeScript Settings / Transpiler Settings (Click for full size image)[/caption]

The other option is simply to create a new TypeScript file in the project you're working in.

[caption id="" align="aligncenter" width="473"]<a href="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-pLkh2z4/0/O/typescript01.png"><img class="" src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-pLkh2z4/0/L/typescript01-L.png" alt="Creating a new TypeScript File. (Click for full size image)" width="473" height="600" /></a> Creating a new TypeScript File. (Click for full size image)[/caption]

When the file is created and opened in the WebStorm Editor, a prompt above the file will show up to turn on the transpiler.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-LgZhchD/0/O/typescript02.png"><img class="" src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-LgZhchD/0/L/typescript02-L.png" alt="Enable (Click for full size image)" width="800" height="240" /></a> Enable (Click for full size image)[/caption]

This will setup the project and turn on the transpiler for TypeScript. Once this is done any TypeScript file will automatically be compiled. For instance, I added this basic code to the coder.js file that I just created above.

[sourcecode language="javascript"]
/**
 * Created by adron on 7/26/15.
 * Description: An class around the coder in the system.
 */

class Coder {
  name:string;
  constructor(theName: string) { this.name = theName; }
  swapWith(teamGroup: number = 0) {
    alert(this.name + &quot; swapping &quot; + teamGroup + &quot;m.&quot;);
  }
}

class SwappingCoder extends Coder {
  constructor(name: string) { super(name); }
  swapWith(meters = 5) {
    alert(&quot;Slithering...&quot;);
    super.swapWith(meters);
  }
}

class SwappeeCoder extends Coder {
  constructor(name: string) { super(name); }
  swapWith(meters = 45) {
    super.swapWith(meters);
  }
}
[/sourcecode]

This code, as soon as I saved the file was immediately transpiled into the following JavaScript and .js.map file as shown.

First the JavaScript code of the transpilation.

[sourcecode language="javascript"]
/**
 * Created by adron on 7/26/15.
 * Description: An class around the coder in the system.
 */
var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var Coder = (function () {
    function Coder(theName) {
        this.name = theName;
    }
    Coder.prototype.swapWith = function (teamGroup) {
        if (teamGroup === void 0) { teamGroup = 0; }
        alert(this.name + &quot; swapping &quot; + teamGroup + &quot;m.&quot;);
    };
    return Coder;
})();
var SwappingCoder = (function (_super) {
    __extends(SwappingCoder, _super);
    function SwappingCoder(name) {
        _super.call(this, name);
    }
    SwappingCoder.prototype.swapWith = function (meters) {
        if (meters === void 0) { meters = 5; }
        alert(&quot;Slithering...&quot;);
        _super.prototype.swapWith.call(this, meters);
    };
    return SwappingCoder;
})(Coder);
var SwappeeCoder = (function (_super) {
    __extends(SwappeeCoder, _super);
    function SwappeeCoder(name) {
        _super.call(this, name);
    }
    SwappeeCoder.prototype.swapWith = function (meters) {
        if (meters === void 0) { meters = 45; }
        _super.prototype.swapWith.call(this, meters);
    };
    return SwappeeCoder;
})(Coder);
//# sourceMappingURL=coder.js.map
[/sourcecode]

Now the map JSON data that is also transpiled automatically by WebStorm.

[sourcecode language="javascript"]
{&quot;version&quot;:3,&quot;file&quot;:&quot;coder.js&quot;,&quot;sourceRoot&quot;:&quot;&quot;,&quot;sources&quot;:[&quot;coder.ts&quot;],&quot;names&quot;:[&quot;Coder&quot;,&quot;Coder.constructor&quot;,&quot;Coder.swapWith&quot;,&quot;SwappingCoder&quot;,&quot;SwappingCoder.constructor&quot;,&quot;SwappingCoder.swapWith&quot;,&quot;SwappeeCoder&quot;,&quot;SwappeeCoder.constructor&quot;,&quot;SwappeeCoder.swapWith&quot;],&quot;mappings&quot;:&quot;AAAA;;;GAGG;;;;;;;AAEH,IAAM,KAAK;IAETA,SAFIA,KAAKA,CAEGA,OAAeA;QAAIC,IAAIA,CAACA,IAAIA,GAAGA,OAAOA,CAACA;IAACA,CAACA;IACrDD,wBAAQA,GAARA,UAASA,SAAqBA;QAArBE,yBAAqBA,GAArBA,aAAqBA;QAC5BA,KAAKA,CAACA,IAAIA,CAACA,IAAIA,GAAGA,YAAYA,GAAGA,SAASA,GAAGA,IAAIA,CAACA,CAACA;IACrDA,CAACA;IACHF,YAACA;AAADA,CAACA,AAND,IAMC;AAED,IAAM,aAAa;IAASG,UAAtBA,aAAaA,UAAcA;IAC/BA,SADIA,aAAaA,CACLA,IAAYA;QAAIC,kBAAMA,IAAIA,CAACA,CAACA;IAACA,CAACA;IAC1CD,gCAAQA,GAARA,UAASA,MAAUA;QAAVE,sBAAUA,GAAVA,UAAUA;QACjBA,KAAKA,CAACA,eAAeA,CAACA,CAACA;QACvBA,gBAAKA,CAACA,QAAQA,YAACA,MAAMA,CAACA,CAACA;IACzBA,CAACA;IACHF,oBAACA;AAADA,CAACA,AAND,EAA4B,KAAK,EAMhC;AAED,IAAM,YAAY;IAASG,UAArBA,YAAYA,UAAcA;IAC9BA,SADIA,YAAYA,CACJA,IAAYA;QAAIC,kBAAMA,IAAIA,CAACA,CAACA;IAACA,CAACA;IAC1CD,+BAAQA,GAARA,UAASA,MAAWA;QAAXE,sBAAWA,GAAXA,WAAWA;QAClBA,gBAAKA,CAACA,QAAQA,YAACA,MAAMA,CAACA,CAACA;IACzBA,CAACA;IACHF,mBAACA;AAADA,CAACA,AALD,EAA2B,KAAK,EAK/B&quot;}
[/sourcecode]

This is a great feature, as it removes any need for manually building these files and such. Immediately they're available in other code files when this is enabled.

<strong>Code Formatting</strong>

One of the next features I really like is the code formatting that is available in the TypeScript settings for the language.

[caption id="" align="aligncenter" width="800"]<a href="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-RGvSTcz/0/O/typescript-feature-01.png"><img src="http://photos.adron.me/Software/Software-Development/Work-Flow-of-JavaScript/i-RGvSTcz/0/L/typescript-feature-01-L.png" alt="TypeScript Code Formatting / Styles (Click for full size image)" width="800" height="522" /></a> TypeScript Code Formatting / Styles (Click for full size image)[/caption]

<strong>Code Completion</strong>
<ul>
	<li>Basic code completion on ^ Space.</li>
	<li>Type completion on ^ ⇧ Space.</li>
	<li>Completing punctuation on Enter.</li>
	<li>Completing statements with smart Enter.</li>
	<li>Completing paths in the Select Path dialog.</li>
	<li>Expanding words with ⌥ Slash.</li>
</ul>
<strong>Refactoring</strong>

Out of the top features I like, along with automatic transpiling, from WebStorm (and the other jetbrains products too) is the ability to do various refactorings on the code base! This one is also more valuable than the transpiling feature, by far, but it's right there on par as far as my own interest in the feature since I find manually transpiling annoying.
<ul>
	<li><a href="https://www.jetbrains.com/webstorm/help/copy-clone.html" target="_blank">Copy/Clone</a> - The Copy refactoring allows you to copy a class, file, or directory with its entire structure from one directory to another, or clone it within the same directory.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/move-refactorings.html" target="_blank">Move Refactorings</a> - The Move refactorings allow you to move files and directories within a project. So doing, WebStorm automatically corrects all references to the moved symbols in the source code.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/rename-refactorings.html" target="_blank">Renaming</a> - Rename refactorings allow you to rename symbols , automatically correcting all references in the code.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/safe-delete.html" target="_blank">Safe Delete</a> - The Safe Delete refactoring lets you safely remove files and symbols from the source code.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/extract-method.html" target="_blank">Extract Method</a> - When the Extract Method refactoring is invoked in the JavaScript context , WebStorm analyses the selected block of code and detects variables that are the input for the selected code fragment and the variables that are output for it.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/extract-variable.html" target="_blank">Extract Variable</a> - The Extract Variable refactoring puts the result of the selected expression into a variable. It declares a new variable and uses the expression as an initializer. The original expression is replaced with the new variable.</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/change-signature-in-javascript.html" target="_blank">Change Signature</a> - In JavaScript, you can use the Change Signature refactoring to:
<ul>
	<li>Change the function name.</li>
	<li>Add new parameters and remove the existing ones. Note that you can also add a parameter using a dedicated Extract Parameter refactoring.</li>
	<li>Reorder parameters.</li>
	<li>Change parameter names.</li>
	<li>Propagate new parameters through the method call hierarchy.</li>
</ul>
</li>
	<li><a href="https://www.jetbrains.com/webstorm/help/extract-parameter-in-javascript.html" target="_blank">Extract Parameter</a> - The Extract Parameter refactoring is used to add a new parameter to a method declaration and to update the method calls accordingly.</li>
</ul>
So that's the skinny on WebStorm and TypeScript. Happy hacking, cheers!