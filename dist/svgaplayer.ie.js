(function (global) {
    if (typeof global.SVGA === "undefined") {
        global.SVGA = {
            SWFLocation: "SVGAPlayerWeb.swf",
            createUUID: function () {
                var s = [];
                var hexDigits = "0123456789abcdef";
                for (var i = 0; i < 36; i++) {
                    s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
                }
                s[14] = "4";
                s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);
                s[8] = s[13] = s[18] = s[23] = "_";
                var uuid = s.join("");
                return uuid;
            },
            createHandler: function (callback) {
                var uuid = global.SVGA.createUUID();
                global["SVGACB_" + uuid + "_handler"] = function (a, b, c, d, e, f, g) {
                    callback(a, b, c, d, e, f, g);
                };
                return "SVGACB_" + uuid + "_handler";
            },
            createSWFObject: function (container, callback) {
                var uuid = global.SVGA.createUUID();
                var containerElement = typeof container === "object" ? container : document.getElementById(container.replace('#', ''));
                if (containerElement === null || containerElement === undefined) {
                    throw Error("You must provide a valid div ID >>> new Parser(xxx).")
                }
                if (containerElement.getElementsByTagName("object").length === 0) {
                    try {
                        var element = document.createElement("<object id='" + uuid + "' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' />");
                    } catch (error) {
                        var element = document.createElement("object");
                        element.setAttribute("id", uuid);
                        element.setAttribute("classid", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000");
                    }
                    global["SVGACB_" + uuid + "_onReady"] = function () {
                        callback(document.getElementById(uuid));
                    };
                    element.setAttribute("width", containerElement.offsetWidth);
                    element.setAttribute("height", containerElement.offsetHeight);
                    (function (element) {
                        var attr = document.createElement("param");
                        attr.setAttribute("name", "movie");
                        attr.setAttribute("value", global.SVGA.SWFLocation);
                        element.appendChild(attr);
                    })(element);
                    (function (element) {
                        var attr = document.createElement("param");
                        attr.setAttribute("name", "play");
                        attr.setAttribute("value", "true");
                        element.appendChild(attr);
                    })(element);
                    (function (element) {
                        var attr = document.createElement("param");
                        attr.setAttribute("name", "allowScriptAccess");
                        attr.setAttribute("value", "always");
                        element.appendChild(attr);
                    })(element);
                    (function (element) {
                        var attr = document.createElement("param");
                        attr.setAttribute("name", "wmode");
                        attr.setAttribute("value", "transparent");
                        element.appendChild(attr);
                    })(element);
                    (function (element) {
                        var attr = document.createElement("param");
                        attr.setAttribute("name", "FlashVars");
                        attr.setAttribute("value", "uuid=" + uuid);
                        element.appendChild(attr);
                    })(element);
                    containerElement.appendChild(element);
                }
                else {
                    callback(containerElement.getElementsByTagName("object")[0]);
                }
            },
            Parser: function (container) {
                return {
                    load: function (url, success, failure) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAParser_Instance_load(url, SVGA.createHandler(function (videoItem) {
                                success(videoItem);
                            }), SVGA.createHandler(function (message) {
                                failure(new Error(message));
                            }));
                        });
                    }
                };
            },
            Player: function (container) {
                return {
                    setLoops: function (value) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setLoops(value);
                        });
                    },
                    setClearsAfterStop: function (value) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setClearsAfterStop(value);
                        });
                    },
                    setContentMode: function (value) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setContentMode(value);
                        });
                    },
                    setClipsToBounds: function (value) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setClipsToBounds(value);
                        });
                    },
                    pauseAnimation: function () {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_pauseAnimation();
                        });
                    },
                    stopAnimation: function (value) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_stopAnimation(value || true);
                        });
                    },
                    clear: function () {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_clear();
                        });
                    },
                    stepToFrame: function (frame, andPlay) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_stepToFrame(frame, andPlay === true);
                        });
                    },
                    stepToPercentage: function (percentage, andPlay) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_stepToPercentage(percentage, andPlay === true);
                        });
                    },
                    setImage: function (url, forKey) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setImage(url, forKey);
                        });
                    },
                    setText: function (textORMap, forKey) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            if (typeof textORMap === "object") {
                                swfObject.SVGAPlayer_Instance_setText(textORMap.text, textORMap.size, textORMap.color, forKey);
                            }
                            else {
                                swfObject.SVGAPlayer_Instance_setText(textORMap, "", "", forKey);
                            }
                        });
                    },
                    clearDynamicObjects: function () {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_clearDynamicObjects();
                        });
                    },
                    onFinished: function (callback) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_onFinished(SVGA.createHandler(callback));
                        });
                    },
                    onFrame: function (callback) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_onFrame(SVGA.createHandler(callback));
                        });
                    },
                    onPercentage: function (callback) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_onPercentage(SVGA.createHandler(callback));
                        });
                    },
                    setFrame: function (x, y, width, height) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setFrame(x, y, width, height);
                        });
                    },
                    setVideoItem: function (videoItem) {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setVideoItem(videoItem);
                        });
                    },
                    startAnimation: function () {
                        SVGA.createSWFObject(container, function (swfObject) {
                            swfObject.SVGAPlayer_Instance_setFrame(0, 0, swfObject.offsetWidth, swfObject.offsetHeight);
                            swfObject.SVGAPlayer_Instance_startAnimation();
                        });
                    }
                };
            }
        };
    }
})(window);