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
Những bài từ Word được giữ tại `content/posts/son-ha-con-do/` để các link cũ vẫn hoạt động. Chúng là các bài riêng, không đánh số hoặc giới thiệu như sách đã biên tập. Các bài chưa rõ ngày viết không tự gán ngày.

## Wall tản văn

Chọn `categories = ['Tản văn']` là bài tự xuất hiện trên wall của chuyên mục này. Bài dài có nút **Xem thêm / Thu gọn**, bài ngắn hiện trọn vẹn. Mục khác vẫn dùng cách đọc bài cũ. `date` là ngày đăng; để trống nếu không muốn ghi ngày. Đường dẫn cũ `/son-ha-con-do/` vẫn mở được wall.

Bốn bài thêm từ `Tan_Van_Bon_Thien_Moi.md` lấy ngày đăng 11.11.2026, không coi đó là ngày sáng tác. Ý tưởng cho bài khoa học tiếp theo nằm ở `content/posts/bam-play-tu-song-wifi-den-mot-tap-anime/index.md`, đang là draft: từ sóng Wi-Fi đến packet, rồi đến trải nghiệm streaming.

Bài Wi-Fi hiện đã có bản viết đầy đủ và ba sơ đồ SVG cùng thư mục, vẫn giữ draft để đọc lại trước khi đăng. Dùng `hugo server -D` để xem.

Các mẩu tản văn rất ngắn được gom vào `content/posts/may-dong-vun/index.md`. File gốc đặt `build.list: never` để không lặp lại trên wall, tìm kiếm và các danh sách, nhưng vẫn giữ trang ở link cũ. Nội dung từng mẩu không sửa.

Màn rộng từ 1600px có cột gợi ý đọc bên phải. Bố cục nằm ở `assets/scss/reading-rail.scss`, danh sách bài do `layouts/_partials/reading-rail.html` tạo.

Giao diện hiện tại lấy cảm hứng từ bố cục Hydejack của blog `twandesu`: ảnh nền và avatar cũ nằm ở `static/images/twandesu-*`, các chỉnh sửa bố cục nằm trong `assets/scss/twandesu.scss`. Site vẫn build bằng Hugo và Stack.
