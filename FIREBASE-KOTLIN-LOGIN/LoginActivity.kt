package com.example.apprutas

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AlertDialog
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import kotlin.system.exitProcess


class LoginActivity : AppCompatActivity() {
    private lateinit var auth: FirebaseAuth


    override fun onCreate(savedInstanceState: Bundle?) {
        auth = Firebase.auth
        setTheme(R.style.Theme_AppRutas)
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        setup()
    }


    private fun setup(){
        val buttonR : Button = findViewById(R.id.buttonR)
        val buttonL : Button = findViewById(R.id.buttonL)
        val emailET : EditText = findViewById(R.id.emailET)
        val passwordET : EditText = findViewById(R.id.passwordET)

        buttonR.setOnClickListener{
            showSignUp()
        }

        buttonL.setOnClickListener{
            if (checkErrors(emailET,passwordET)){
                auth.signInWithEmailAndPassword(emailET.text.toString(), passwordET.text.toString())
                    .addOnCompleteListener(this) { task ->
                        if (task.isSuccessful) {
                            showHome(emailET.text.toString(), ProviderType.BASIC)
                        } else {
                            showAlertLogin()
                        }
                    }
            }
        }
    }


    private fun showSignUp(){
        val signUpIntent: Intent = Intent(this, SignUpActivity::class.java)
        startActivity(signUpIntent)
        finish()
    }

    private fun showHome(email: String, provider: ProviderType){
        val homeIntent: Intent = Intent(this,HomeActivity::class.java).apply {
            putExtra("email", email)
            putExtra("provider", provider.name)
        }
        startActivity(homeIntent)
        finish()
    }

    private fun checkErrors(emailET: EditText,passwordET:EditText) : Boolean{
        return true;
    }

    private fun showAlertLogin(){
        val buildAlert = AlertDialog.Builder(this)
        buildAlert.setTitle("Error al iniciar sesión")
        buildAlert.setMessage("Se ha producido un error al conectar con el servidor.")
        buildAlert.setPositiveButton("Aceptar", null)
        val dialog : AlertDialog = buildAlert.create()
        dialog.show()

    }

}