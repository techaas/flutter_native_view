// Copyright 2021, Techaas.com. All rights reserved.
//
package com.example.embed_native

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView
import android.util.Log

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        val label = creationParams?.get("message") as String
        Log.d("Native", label)
        textView = TextView(context)
        textView.textSize = 24f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "$label\n\nRendered on a native Android view (id: $id)"
    }
}