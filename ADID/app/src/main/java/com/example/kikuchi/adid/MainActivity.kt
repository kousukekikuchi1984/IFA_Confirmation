package com.example.kikuchi.adid

import android.os.AsyncTask
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.app.Activity
import android.widget.TextView
import com.google.android.gms.ads.identifier.AdvertisingIdClient
import org.w3c.dom.Text

class MainActivity : AppCompatActivity() {

    class ADIDManager: AsyncTask<Void, Void, String> {

        var mActivity: Activity

        constructor(activity: Activity) {
            mActivity = activity
        }

        override fun doInBackground(vararg params: Void?): String {
            var adid = ""
            try {
                val info = AdvertisingIdClient.getAdvertisingIdInfo(mActivity.applicationContext)
                adid = info.id
            } catch (e: Exception) {
                adid = "cannot get adid"
            }
            return adid
        }

        override fun onPostExecute(result: String?) {
            super.onPostExecute(result)
            var textView: TextView = mActivity.findViewById(R.id.adid) as TextView
            textView.text = result
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // advertiser
        val task = ADIDManager(this)
        task.execute()
    }
}
