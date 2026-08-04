allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    plugins.withId("com.android.library") {
        (project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension)?.apply {
            compileSdkVersion(36)
            buildToolsVersion("35.0.0")
        }
    }
    plugins.withId("com.android.application") {
        (project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension)?.apply {
            compileSdkVersion(36)
            buildToolsVersion("35.0.0")
        }
    }
}


subprojects {
    project.evaluationDependsOn(":app")
    plugins.withId("com.android.library") {
        project.dependencies.add("implementation", "androidx.concurrent:concurrent-futures:1.2.0")
    }
    plugins.withId("com.android.application") {
        project.dependencies.add("implementation", "androidx.concurrent:concurrent-futures:1.2.0")
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}



