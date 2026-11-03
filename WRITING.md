# Viết bài trong sổ tay

Chạy bằng Hugo Extended 0.159.1 trở lên:

```bash
hugo server -D
```

`-D` hiện cả bản nháp. GitHub Pages chỉ đăng bài có `draft = false`.

## Bài mới

```bash
hugo new content posts/ten-bai/index.md
```

Sửa phần đầu bài:

```toml
+++
title = 'Tên bài của bạn'
date = 2026-11-03T10:00:00+07:00
draft = true
categories = ['Tản văn']
tags = ['tuổi trẻ', 'nhân gian']
description = 'Một câu giới thiệu bài.'
image = 'cover.jpg'
+++
```

Đặt ảnh cạnh `index.md`, ví dụ `content/posts/ten-bai/cover.jpg`.
Trong bài dùng `![Mô tả ảnh](cover.jpg)`.

## Chuyên mục và hashtag

- `categories`: mảng lớn, chọn Khoa học, Tản văn, Manga hoặc Lịch sử. Một bài có thể thuộc nhiều mục.
- `tags`: chủ đề cụ thể như Inio Asano, bán dẫn, tuổi trẻ. Không cần gõ dấu #; giao diện tự thêm.
- Mỗi chuyên mục có trang riêng. Màu và mô tả nằm trong `content/categories/`.
- Tên site và menu nằm trong `hugo.toml` ở gốc project.
- Màu giấy, mực, font nằm trong `assets/scss/custom.scss`.

Các bài cũ được giữ nguyên nội dung khi chuyển từ Jekyll; bài chip để draft vì còn ghi chú cần biên tập. Các thông tin khoa học chưa được kiểm chứng lại trong lần chuyển giao diện này.
Tuyển tập Word đã được chuyển thành các tác phẩm riêng trong `content/posts/son-ha-con-do/`, có mục lục ở `/son-ha-con-do/`. Nội dung giữ theo tài liệu, không tự gán ngày sáng tác. Trường `sequence` giữ thứ tự đọc, `collectionPart` chia phần và `series` gom tuyển tập.

Giao diện hiện tại lấy cảm hứng từ bố cục Hydejack của blog `twandesu`: ảnh nền và avatar cũ nằm ở `static/images/twandesu-*`, các chỉnh sửa bố cục nằm trong `assets/scss/twandesu.scss`. Site vẫn build bằng Hugo và Stack.
