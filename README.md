
# Jenkins Freestyle CI for Java (Windows)

This repository demonstrates how to build, package, and test a simple Java application using a **Jenkins Freestyle Project** on **Windows**.

## 📁 Project Structure
```
Solution.java
```

### Sample Java Code
```java
public class Solution {
    public static int addNumbers(int a, int b) {
        return a + b;
    }
    public static void main(String[] args) {
        System.out.println(addNumbers(3, 7));
    }
}
```

---

## 🚀 Jenkins Freestyle Setup (Windows)

### 1️⃣ **Source Code Management**
- Select **Git**
- Repository URL:
  ```
  https://github.com/YOUR_USERNAME/YOUR_REPO.git
  ```
- Branch:
  ```
  */main
  ```

---

## 2️⃣ **Build Steps**

### **Step 1 — Build**
Use **Execute Windows batch command**:
```cmd
echo === BUILD ===
javac Solution.java
if errorlevel 1 exit /b 1
```

### **Step 2 — Package**
```cmd
echo === PACKAGE ===
jar cfe solution.jar Solution Solution.class
if errorlevel 1 exit /b 1
```

### **Step 3 — Test**
```cmd
echo === TEST ===
for /f "delims=" %%i in ('java Solution') do set OUTPUT=%%i
echo Output: %OUTPUT%
if "%OUTPUT%"=="10" (
  echo TEST PASSED
) else (
  echo TEST FAILED
  exit /b 1
)
```

---

## 📦 **Artifacts**
Configure:
```
solution.jar
```

---

## 📝 Notes
- Do **NOT** use “Execute shell” on Windows (causes `sh not found` error).
- Ensure JDK + Git are installed and added to PATH.
- This setup works without Maven/Gradle for simple projects.

---

## ✅ Optional Enhancements
- Use JUnit tests
- Add GitHub Webhook → auto-trigger builds
- Deploy artifacts using Pipeline jobs

---

### 👍 You can copy this README directly into your GitHub repo.

