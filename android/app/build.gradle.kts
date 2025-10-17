plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")
    id("dev.flutter.flutter-gradle-plugin")
    kotlin("android")
}

android {
    namespace = "com.example.kundali"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.kundali"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        addManifestPlaceholders(mapOf(
            "stripePublishableKey" to "pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG"
        ))
    }

    buildTypes {
        getByName("debug") {
            addManifestPlaceholders(mapOf(
                "stripePublishableKey" to "pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG"
            ))
        }
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            addManifestPlaceholders(mapOf(
                "stripePublishableKey" to "pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG"
            ))
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
    implementation("androidx.fragment:fragment-ktx:1.6.2")
}

flutter {
    source = "../.."
}