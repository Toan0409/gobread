package vn.banhmi.gobread.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.UUID;

@Service
public class UploadService {

    public String handleSaveUploadFile(MultipartFile file, String folder, String type) {
        try {
            // Tạo đường dẫn thư mục lưu
            String uploadDir = "uploads/images/product";

            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Tạo tên file ngẫu nhiên tránh trùng
            String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

            // Lưu file
            Path path = Paths.get(uploadDir, filename);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

            return filename; // Trả về tên file để lưu DB
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi lưu ảnh: " + e.getMessage());
        }
    }
}