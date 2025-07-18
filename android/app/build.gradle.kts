import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("keystore.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.flowpause.breathe"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.flowpause.breathe"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
    println("KEYS: ${keystoreProperties.entries}")

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as? String
                ?: throw GradleException("Missing keyAlias in keystore.properties")
            keyPassword = keystoreProperties["keyPassword"] as? String
                ?: throw GradleException("Missing keyPassword in keystore.properties")
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                ?: throw GradleException("Missing storeFile in keystore.properties")
            storePassword = keystoreProperties["storePassword"] as? String
                ?: throw GradleException("Missing storePassword in keystore.properties")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
