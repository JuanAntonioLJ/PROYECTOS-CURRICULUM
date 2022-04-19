package com.example.apprutas

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.content.Intent
import android.widget.Button
import android.widget.TextView
import com.google.firebase.auth.FirebaseAuth


class HomeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        val bundle : Bundle?= intent.extras
        val email:String?=bundle?.getString("email")
        val provider:String?=bundle?.getString("provider")
        setup(email ?: "", provider ?:"")



    }
    private fun setup(email:String, provider: String){
        title="Inicio"

        val emailTV:TextView = findViewById(R.id.emailTV)
        emailTV.text=email
        val providerTV:TextView = findViewById(R.id.providerTV)
        providerTV.text=provider

        val buttonCS:Button = findViewById(R.id.buttonCS)
        buttonCS.setOnClickListener{
            FirebaseAuth.getInstance().signOut()
            val intentLoginActivity : Intent = Intent(this,LoginActivity::class.java)
            startActivity(intentLoginActivity)
            finish()
        }

    }

    override fun onBackPressed() {
        val intentLoginActivity: Intent = Intent(this,LoginActivity::class.java)
        startActivity(intentLoginActivity)
        finish()
    }
}
