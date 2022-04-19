package com.example.apprutas

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.content.Intent
import android.widget.Button
import android.widget.CheckBox
import android.widget.EditText
import androidx.appcompat.app.AlertDialog
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase


class SignUpActivity : AppCompatActivity() {
    private lateinit var auth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        auth = Firebase.auth
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_up)

        setup()
    }

    private fun setup(){
        val usuarioET2 : EditText = findViewById(R.id.usuarioET2)
        val emailET2 : EditText = findViewById(R.id.emailET2)
        val passwordET2 : EditText = findViewById(R.id.passwordET2)
        val rpasswordET2 : EditText = findViewById(R.id.rpasswordET2)
        val checkPrivacy : CheckBox = findViewById(R.id.checkPrivacy)


        val buttonCancel : Button = findViewById(R.id.buttonCancel)
        buttonCancel.setOnClickListener{
            showLogin()
        }

        val buttonSignUp : Button = findViewById(R.id.buttonSignUp)
        buttonSignUp.setOnClickListener{
            if (checkErrors(usuarioET2,emailET2,
                passwordET2,rpasswordET2,checkPrivacy)){
                auth.createUserWithEmailAndPassword(emailET2.text.toString().trim(), passwordET2.text.toString().trim())
                    .addOnCompleteListener {
                        if (it.isSuccessful){
                            showHome(it.result?.user?.email ?: "",ProviderType.BASIC)
                        }
                        else showAlertSignUp()
                    }
            }
        }
    }

    private fun showHome(email: String, provider: ProviderType){
        val homeIntent: Intent = Intent(this,HomeActivity::class.java).apply {
            putExtra("email", email)
            putExtra("provider", provider.name)
        }
        startActivity(homeIntent)
        finish()
    }

    private fun showLogin(){
        val intentLoginActivity: Intent = Intent(this,LoginActivity::class.java)
        startActivity(intentLoginActivity)
        finish()
    }


    private fun showAlertSignUp(){
        val buildAlert = AlertDialog.Builder(this)
        buildAlert.setTitle("Error al registrar")
        buildAlert.setMessage("Se ha producido un error al registrar su cuenta" +
                " en nuestra base de datos.")
        buildAlert.setPositiveButton("Aceptar", null)
        val dialog : AlertDialog = buildAlert.create()
        dialog.show()

    }

    private fun checkErrors(usuario: EditText, email: EditText, password:EditText, rpassword:EditText, checkPrivacy: CheckBox) : Boolean{
        //TODO: Completar
        return true
    }

    override fun onBackPressed() {
        showLogin()
    }


}
