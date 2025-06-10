import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("savings-flavor")

    productFlavors {
        create("dev") {
            dimension = "savings-flavor"
            applicationId = "pub.brs.savings.dev"
            resValue(type = "string", name = "app_name", value = "Savings (Dev)")
        }
        create("prod") {
            dimension = "savings-flavor"
            applicationId = "pub.brs.savings"
            resValue(type = "string", name = "app_name", value = "Savings")
        }
    }
}