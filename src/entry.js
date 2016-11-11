//workbench app entrypoint
"use strict";

//global requires

//STYLE
require("./style/scss/app-globals.scss");
require("bootstrap/dist/css/bootstrap.min.css");
require("bootstrap/dist/css/bootstrap-theme.min.css");
require("bootstrap/dist/fonts/glyphicons-halflings-regular.woff");
require("font-awesome/css/font-awesome.min.css");

//JAVASCRIPT LIBS
import $ from "jquery";
window.jQuery = $;
window.$ = $;
require('bootstrap');

//REACT
import React from "react";
import ReactDom from "react-dom";
window.React = React;
import {Router, Route, IndexRoute, hashHistory} from "react-router";


// //initialize SPA
import Layout from "./js/views/Layout";        
const app = $('#app-container')[0];


//Configure Routing
ReactDom.render(
    <Router history={hashHistory} >
        <Route path="/" component={Layout}>
        </Route>
    </Router>,
    app
);
