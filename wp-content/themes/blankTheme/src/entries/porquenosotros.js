import "../scss/porquenosotros.scss";
import { TweenMax, CSSPlugin, EasePack, TimelineMax, gsap } from "gsap";
import Typed from 'typed.js';
import ScrollMagic from "scrollmagic";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap";
import "imports-loader?define=>false!scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators";
$('header').addClass('active2');
let controller = new ScrollMagic.Controller();
let scene_5 = new ScrollMagic.Scene({
triggerElement: "#descuento"
})
.setClassToggle('#descuento', 'animation')
.addTo(controller);