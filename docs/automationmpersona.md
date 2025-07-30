```markdown
---
layout: page
title: Nâng cao
description: >
  Automation Persona Framework - Một ý tưởng cơ bản
hide_description: true
sitemap: false
---

# AutoPersona Framework – Ghi chú của một kẻ hay quên

---

## I. AutoPersona là cái quái gì?

AutoPersona là một framework được tạo ra để giải quyết một vấn đề thực tế: làm sao để từ vài dòng mô tả mơ hồ của team marketing, chuyển thành **nhóm khách hàng thật** để triển khai chiến dịch?

### Câu chuyện ban đầu

Team marketing thường viết brief kiểu:

> “Tìm nhóm khách hàng hay dùng camera AI ở nhà, thu nhập cao, và từng sử dụng dịch vụ cloud.”

Họ không biết SQL, cũng chẳng hiểu graph hay LLM là gì. Nhưng hệ thống của chúng ta phải hiểu họ.

### Quy trình AutoPersona

1. **Người dùng nhập prompt tự nhiên**
   → `"Tìm nhóm thích camera AI + thu nhập cao"`
   → Gửi đến server LLM.

2. **LLM tạo một node ảo (virtual persona)**
   Một vector/JSON mô tả đặc điểm của persona, ví dụ:

   ```json
   {
     "camera_usage": 1.0,
     "income_level": 0.9,
     "ai_affinity": 0.8
   }
   ```

3. **Node ảo được đưa vào graph khách hàng thật**
   → Sử dụng Node2Vec / Random Walk để tìm nhóm gần nhất.

   ```python
   from node2vec import Node2Vec
   import networkx as nx

   # Tải graph khách hàng
   graph = nx.read_gpickle("customer_graph.pkl")

   # Huấn luyện mô hình Node2Vec
   node2vec = Node2Vec(graph, dimensions=64, walk_length=30, num_walks=200)
   model = node2vec.fit()

   # Tìm các khách hàng giống nhất với vector ảo
   similar_customers = model.wv.most_similar(positive=[virtual_node_vector], topn=50)
   ```

4. **LLM xử lý nhóm khách hàng**
   → Tạo mô tả dễ hiểu cho con người
   → Xuất file CSV chứa dữ liệu khách hàng và gửi link về frontend.

---

## II. Tại sao chọn Qwen2.5-3B-Instruct?

### Tiêu chí chọn LLM

- Nhẹ, chạy được trên Colab hoặc máy bàn với GPU 6–8GB.
- Hiểu tiếng Việt, không trả lời kiểu “tôi không hiểu bạn nói gì”.
- Open source, không cần xin token.
- Có khả năng suy luận, đọc JSON, tạo prompt tự nhiên, không chỉ trả lời Q&A.

### Lý do chọn Qwen2.5-3B

- Tốc độ cao (tokenizer riêng của Alibaba).
- Giới hạn token cao, xử lý được prompt dài mà không bị nghẽn.
- Suy luận tốt, ít bịa đặt hơn so với các mô hình Trung Quốc đời cũ.
- Dễ host bằng vLLM.

### Chạy Qwen local bằng vLLM

```bash
# Tạo môi trường ảo
python -m venv vllm_env
source vllm_env/bin/activate

# Cài vLLM và PyTorch
pip install vllm torch --index-url https://download.pytorch.org/whl/cu121

# Chạy server API
python -m vllm.entrypoints.openai.api_server \
  --model Qwen/Qwen2.5-3B-Instruct \
  --served-model-name qwen \
  --port 5000
```

---

## III. Tại sao dùng ngrok?

### Vấn đề

Khi host mô hình trên Colab hoặc localhost, chỉ có `localhost:5000` hoạt động, không ai từ bên ngoài truy cập được.

### Nhu cầu

- Cách đơn giản để expose server ra Internet.
- Có thể gọi từ hệ thống UI nội bộ.
- Không cần cấu hình domain, DNS, v.v.

### So sánh ngrok và Cloudflared

| Công cụ      | Ưu điểm                     | Nhược điểm                     |
|--------------|-----------------------------|--------------------------------|
| ngrok        | Dễ dùng, có dashboard       | Cần tạo tài khoản              |
| Cloudflared  | Không cần đăng ký           | Hay timeout, khó debug         |

Cloudflared bản miễn phí thường timeout sau 15 phút, không ổn định.

### Thiết lập ngrok trên Colab

```bash
# Tải và cài đặt ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
mv ngrok /usr/local/bin

# Thêm authtoken của ngrok
ngrok config add-authtoken <your_ngrok_token>

# Mở tunnel
ngrok http 5000
```

**Kết quả**: Tạo ra một URL công khai kiểu `https://1234-xyz.ngrok.io`, frontend có thể gọi API bình thường.

---

## IV. Tổng kết

AutoPersona là một hệ thống chắp vá nhưng hoạt động được:
- Sử dụng LLM để tạo persona.
- Kết hợp với graph để tìm khách hàng thật.
- Cung cấp API cho frontend.
- Tạo mô tả dễ hiểu cho đội ngũ kinh doanh.

Mục tiêu là tự động hóa các chiến dịch marketing mà không cần chuyên gia kỹ thuật can thiệp.

### Ghi chú bổ sung

- **Dữ liệu khách hàng**: Lưu dưới dạng DataFrame m×n trên S3.
- **Quy tắc kinh doanh**: Định dạng JSON, ví dụ:

   ```json
   {
     "fee": {
       "high": "> 5000000",
       "medium": "2000000 - 5000000"
     },
     "segment": {
       "vip": ["long_term", "spending > 7m"]
     }
   }
   ```

   LLM có thể đọc các quy tắc này để tạo prompt, lọc, hoặc phân cụm.

- **Kết quả**: Xuất ra S3, ghi log vào PostgreSQL.

### Việc cần làm tiếp theo

- Viết thêm về phân cụm (Flow 2).
- Mô tả pipeline offline với Airflow.
- Tách logic thành các module rõ ràng hơn.
- Xây dựng hệ thống versioning cho persona/nhóm.
```