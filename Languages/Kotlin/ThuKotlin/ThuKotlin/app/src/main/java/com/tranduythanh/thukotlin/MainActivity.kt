package com.tranduythanh.thukotlin

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btnTinh.setOnClickListener(View.OnClickListener { xuLyTinh() })
    }

    private fun xuLyTinh() {
        val a:Int=edtA.text.toString().toInt()
        val b:Int=edtB.text.toString().toInt()
        val c:Int=a+b
        txtKetQua.text=c.toString()
    }
}
