// android/build.gradle.kts

plugins {
    id("com.android.application") version "8.5.2" apply false
    id("com.android.library") version "8.5.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.25" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// --- di chuyển logic đổi build dir xuống afterEvaluate để tránh lỗi BasePlugin ---
gradle.afterProject {
    if (this == rootProject) {
        val newBuildDir = layout.buildDirectory.dir("../../build").get()
        layout.buildDirectory.set(newBuildDir)
    } else {
        val newSubprojectBuildDir = rootProject.layout.buildDirectory.dir(name)
        layout.buildDirectory.set(newSubprojectBuildDir)
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
