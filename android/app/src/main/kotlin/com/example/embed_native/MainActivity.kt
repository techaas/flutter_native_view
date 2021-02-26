// Copyright 2021, Techaas.com. All rights reserved.
//
package com.example.embed_native

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("NativeView", NativeViewFactory())
    }
}
