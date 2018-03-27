<style>
.css-class-add, .css-class-remove {
  transition: all 1.5s cubic-bezier(0.250, 0.460, 0.450, 0.940);
}

.css-class, .css-class-add.css-class-add-active {
  color: red;
  font-size: 3em;
}

.css-class-remove.css-class-remove-active {
  font-size: 1em;
  color: black;
}
.fade.ng-enter {
  transition:0.5s linear all;
  opacity:0;
}

.fade.ng-enter.ng-enter-active {
  opacity:1;
}
</style>
<p ng-app="app">
  <button ng-click="myCssVar='css-class'">Set</button>
  <button ng-click="myCssVar=''">Clear</button>
  <br>
  <span ng-class="myCssVar">CSS-Animated Text</span>
</p>

<div ng-if="bool" class="fade">
   Fade me in out
</div>
<button ng-click="bool=true">Fade In!</button>
<button ng-click="bool=false">Fade Out!</button>