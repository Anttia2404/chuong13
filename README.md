# EmailListApp - Maven Version

## 📁 Cấu trúc project đã hoàn chỉnh

```
EmailListApp-Maven/
├── pom.xml                          ← Maven configuration
├── src/
│   └── main/
│       ├── java/
│       │   └── murach/
│       │       ├── admin/           ← UsersServlet
│       │       ├── business/        ← User entity
│       │       ├── data/            ← DBUtil, UserDB
│       │       └── email/           ← EmailListServlet
│       ├── resources/
│       │   └── META-INF/
│       │       └── persistence.xml  ← JPA configuration
│       └── webapp/
│           ├── admin/               ← Admin JSP pages
│           ├── WEB-INF/
│           ├── index.jsp
│           └── thanks.jsp
```

## 🚀 Cách sử dụng

### Bước 1: Mở project trong NetBeans
1. Mở NetBeans
2. **File** → **Open Project**
3. Chọn thư mục `EmailListApp-Maven`
4. Click **Open Project**

NetBeans sẽ tự động nhận diện đây là Maven project!

### Bước 2: Build project
1. Chuột phải vào project → **Clean and Build**
2. Maven sẽ tự động download tất cả dependencies
3. Chờ build hoàn tất (lần đầu có thể mất 1-2 phút)

### Bước 3: Cấu hình Tomcat (nếu chưa có)
1. **Tools** → **Servers**
2. **Add Server** → Chọn **Apache Tomcat**
3. Browse đến thư mục Tomcat của bạn
4. Click **Finish**

### Bước 4: Run project
1. Chuột phải vào project → **Run**
2. Hoặc nhấn **F6**
3. NetBeans sẽ deploy lên Tomcat và mở browser

## ✅ Tất cả dependencies đã được cấu hình

Maven sẽ tự động download:
- ✅ Jakarta Servlet API
- ✅ Jakarta Persistence API (JPA)
- ✅ EclipseLink (JPA implementation)
- ✅ MySQL Connector
- ✅ JSTL

**KHÔNG CẦN** cấu hình classpath thủ công!

## 🎯 Test ứng dụng

### Email List App
- URL: `http://localhost:8080/EmailListApp/`
- Thêm users vào database

### User Admin
- URL: `http://localhost:8080/EmailListApp/admin/users`
- Xem, sửa, xóa users

## 🔧 Nếu cần build từ command line

```bash
cd EmailListApp-Maven
mvn clean package
```

File WAR sẽ được tạo tại: `target/EmailListApp.war`

## 📝 Lưu ý

- Database: `murach_jpa` trên `localhost:3306`
- MySQL user: `root` (no password)
- Đảm bảo MySQL đang chạy trước khi start app

---

**Chúc mừng! Project Maven đã sẵn sàng sử dụng! 🎉**
