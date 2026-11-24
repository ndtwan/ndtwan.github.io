---
title: 'Giả thuyết Riemann, Claude'
date: 2026-11-24
draft: false
categories: ['Khoa học']
tags: ['toán học', 'AI', 'Lean', 'Riemann']
description: 'Một lời giải, hàng triệu dòng Lean, và khoảng cách giữa những điều nhân loại biết với những điều con người thực sự hiểu.'
---

Có lẽ một trong những sự kiện thú vị nhất của giới khoa học những ngày gần đây là việc Levent Alpöge, một nhà toán học tại Anthropic, công bố rằng ông cùng với Claude đã tìm ra lời giải cho giả thuyết Riemann, một bài toán tồn tại từ năm 1859 và là một trong bảy bài toán thiên niên kỷ của Viện Toán học Clay.

Điều khiến cộng đồng khoa học tranh luận không chỉ nằm ở việc một hệ thống AI đã tham gia giải quyết bài toán mà nhân loại mất hơn một thế kỷ rưỡi vẫn chưa thể giải quyết, mà còn ở hình thức của lời giải: khoảng 17 triệu dòng mã Lean, với những phần kiến thức mà ngay cả người công bố công trình cũng chưa hoàn toàn nắm vững.

Tôi có đọc qua một số cuộc tranh luận trên các diễn đàn về sự kiện này. Một bên cho rằng đây là khởi đầu của một thời đại mới trong nghiên cứu khoa học, bên còn lại đặt câu hỏi về giá trị của một chứng minh toán học mà chưa có con người nào hoàn toàn thấu hiểu.

Cả hai quan điểm đều có những lý lẽ khá thú vị.

## Về cách toán học phát triển

Hồi tiểu học, chúng ta được dạy về các số tự nhiên. Lên những cấp học cao hơn, chúng ta biết thêm về số âm, số hữu tỷ, số vô tỷ, rồi đến số phức. Mỗi lần mở rộng tập hợp số, chúng ta lại có khả năng giải quyết những phương trình vốn không có nghiệm trong tập hợp số trước đó.

Đây là một ví dụ tương đối đơn giản về cách toán học phát triển.

Với những bài toán đủ khó, khi các phương pháp hiện có không mang lại kết quả, các nhà toán học thường phải phát triển những công cụ mới, hoặc tìm cách kết nối những công cụ thuộc các lĩnh vực tưởng chừng không liên quan đến nhau.

Những nỗ lực nghiên cứu khả năng giải phương trình đa thức bậc năm bằng căn thức đã góp phần hình thành lý thuyết Galois và lý thuyết nhóm. Các bài toán dựng hình bằng thước và compa của người Hy Lạp cổ đại, như cầu phương hình tròn hay gấp đôi khối lập phương, về sau lại được giải quyết bằng những kiến thức thuộc đại số và lý thuyết trường.

Hay bản thân giả thuyết Riemann cũng là một ví dụ rất đẹp về sự liên hệ giữa giải tích phức và lý thuyết số. Một bài toán về sự phân bố của các số nguyên tố lại có thể được nghiên cứu thông qua vị trí các nghiệm của một hàm số trên mặt phẳng phức.

Nếu hình dung toàn bộ tri thức toán học như một tấm bản đồ, thì mỗi công cụ toán học mới cho phép chúng ta mở rộng phạm vi của tấm bản đồ ấy. Giá trị của việc giải quyết một bài toán lớn không chỉ nằm ở đáp án cuối cùng, mà còn ở những miền tri thức được khám phá trong quá trình tìm kiếm đáp án đó.

Đây cũng là một trong những lý do khiến giới toán học dành nhiều sự quan tâm đến các bài toán thiên niên kỷ. Người ta kỳ vọng rằng để giải quyết được chúng, nhân loại sẽ phải tìm ra những phương pháp đủ mạnh để tiếp tục giải quyết hàng loạt vấn đề khác.

Tất nhiên, điều đó không có nghĩa rằng giả thuyết Riemann nhất thiết phải cần đến một nhánh toán học hoàn toàn mới. Chúng ta chưa từng chứng minh được rằng những công cụ toán học hiện có là không đủ.

## Trực giác toán học và AI

Một trong những khó khăn lớn nhất của nghiên cứu toán học là việc lựa chọn hướng tiếp cận.

Giả sử một nhà toán học nghĩ ra bốn phương pháp A, B, C và D để giải quyết một bài toán. Họ không thể biết chắc phương pháp nào sẽ đưa mình đến đích, và đôi khi phải dành nhiều năm để phát triển một phương pháp mới có thể đánh giá được tính khả thi của nó.

Hoàn toàn có khả năng một người dành mười năm nghiên cứu phương pháp A, để rồi nhận ra rằng phương pháp C mới là thứ đáng lẽ mình nên theo đuổi ngay từ đầu.

Bởi vậy, trực giác toán học là một năng lực đặc biệt quan trọng. Nó giúp các nhà toán học nhận ra triển vọng của một ý tưởng ngay cả khi chưa có đủ cơ sở để khẳng định rằng ý tưởng ấy sẽ thành công.

Với sự xuất hiện của AI, quy trình nghiên cứu này có thể thay đổi.

Thay vì dành nhiều năm lần lượt khảo sát từng hướng tiếp cận, một nhà toán học có thể đề xuất hàng chục phương pháp, sử dụng AI để đồng thời phát triển chúng, tìm kiếm các bổ đề trung gian, kiểm tra hệ quả và đánh giá triển vọng của từng hướng. Sau đó, nguồn lực nghiên cứu sẽ được tập trung vào những phương pháp có khả năng mang lại kết quả tốt nhất.

Đây là cách mà trước kia tôi hình dung AI sẽ tham gia vào nghiên cứu khoa học. Con người vẫn đóng vai trò chủ đạo trong việc sáng tạo ý tưởng, còn AI giúp giảm thiểu thời gian và chi phí để kiểm chứng những ý tưởng ấy.

Tuy nhiên, câu chuyện của Alpöge và Claude dường như đã tiến xa hơn một chút. Trong quá trình xây dựng chứng minh, Claude không chỉ thực hiện những suy luận được giao mà còn tham gia đề xuất các lựa chọn kỹ thuật quan trọng.

Liệu đó có được xem là sự sáng tạo toán học, hay chỉ là kết quả của việc tổng hợp và vận dụng một khối lượng tri thức khổng lồ?

Cá nhân tôi thấy việc phân biệt hai khái niệm này ngày càng trở nên khó khăn. Xét cho cùng, phần lớn những ý tưởng sáng tạo của con người cũng được hình thành từ việc kết hợp và tái cấu trúc những kiến thức mà chúng ta đã tiếp nhận trước đó.

## 17 triệu dòng mã và 250.000 trang giấy

Có một quan điểm khá phổ biến trong những ngày đầu sau khi công trình được công bố, ấy là một chứng minh dài 250.000 trang giấy, không có con người nào đủ khả năng đọc hết, thì khó có thể mang lại giá trị thực sự cho toán học.

Tuy nhiên, có hai vấn đề cần làm rõ.

Thứ nhất, con số 250.000 trang mà Alpöge đề cập ban đầu đã được chính ông đính chính là một lời nói đùa. Hiện tại, chưa thể biết một bản chứng minh được biên soạn đầy đủ và phù hợp với cách đọc của các nhà toán học sẽ dài bao nhiêu.

Thứ hai, 17 triệu dòng mã Lean không tương đương với 17 triệu dòng lập luận toán học độc lập.

Để hình thức hóa một chứng minh, người ta phải diễn đạt tường minh rất nhiều kiến thức nền tảng, điều kiện, định nghĩa và các bước suy luận mà trong một bài báo toán học thông thường có thể được lược bỏ hoặc viện dẫn từ những công trình trước đó.

Một ví dụ để so sánh là công trình hình thức hóa định lý cuối cùng của Fermat bằng AI trước đó cũng có quy mô khoảng 13 triệu dòng mã Lean, trong khi các bài báo chứng minh của Andrew Wiles và Richard Taylor có tổng độ dài khoảng 130 trang.

Đương nhiên, đây không phải là một tỷ lệ quy đổi. Chúng ta không thể lấy số dòng Lean chia cho số trang chứng minh Fermat rồi suy ra độ dài thực tế của chứng minh Riemann. Nhưng ít nhất nó cho thấy rằng số dòng mã không phải là một thước đo đáng tin cậy cho độ phức tạp về mặt ý tưởng của một công trình toán học.

Ngoài ra, Lean cũng không phải là một mô hình ngôn ngữ khác được sử dụng để kiểm tra câu trả lời của Claude. Nó là một hệ thống chứng minh định lý hình thức, hoạt động dựa trên những quy tắc logic xác định. Nếu phát biểu toán học được hình thức hóa chính xác và chứng minh được kiểm tra trong một hệ tiên đề phù hợp, việc xác minh không còn phụ thuộc vào chuyện một mô hình AI khác có đồng tình với Claude hay không.

Bởi vậy, quy kết toàn bộ công trình là brute-force hay AI slop chỉ dựa trên độ dài của nó, theo tôi, là một nhận định có phần vội vàng.

## Có nhất thiết phải hiểu một công cụ trước khi sử dụng nó?

Tôi đọc được một ví dụ khá thú vị trên một diễn đàn.

Giả sử chúng ta quay ngược thời gian về khoảng 500 năm trước, mang theo một chiếc máy tính cầm tay Casio và đưa nó cho những nhà toán học đương thời.

Đối với họ, đây là một thiết bị có khả năng thực hiện trong vài giây những phép tính mà trước đó phải mất rất nhiều thời gian để hoàn thành bằng tay. Tuy nhiên, không ai trong số họ hiểu được nguyên lý hoạt động của nó, từ các mạch điện tử cho đến cách biểu diễn số và thực hiện các phép toán bên trong.

Khi ấy, họ có hai lựa chọn.

Một là từ chối sử dụng thiết bị cho đến khi có thể tự mình xây dựng và hiểu được toàn bộ nguyên lý hoạt động của nó.

Hai là kiểm tra độ tin cậy của thiết bị trong phạm vi có thể, sau đó sử dụng nó để giải quyết những vấn đề khác, đồng thời tiếp tục nghiên cứu cách thức mà nó hoạt động.

Nhóm thứ nhất có thể phải mất hàng thế kỷ để tự phát triển những công nghệ cần thiết nhằm chế tạo ra một chiếc máy tính tương tự. Nhóm thứ hai, trong cùng khoảng thời gian ấy, đã có thể sử dụng chiếc máy để phục vụ cho thiên văn học, cơ học, hàng hải và nhiều lĩnh vực khác. Thậm chí, những tri thức được sinh ra từ quá trình sử dụng thiết bị có thể giúp họ hiểu được chính thiết bị ấy sớm hơn.

Dĩ nhiên, phép so sánh này không hoàn toàn tương đương với một chứng minh toán học. Việc thử nghiệm một chiếc máy tính qua một số phép tính hữu hạn không đảm bảo rằng nó luôn trả về kết quả đúng, trong khi toán học đòi hỏi những tiêu chuẩn chặt chẽ hơn về tính hợp lệ của suy luận.

Nhưng tư tưởng đằng sau ví dụ ấy vẫn đáng để suy ngẫm: liệu chúng ta có nhất thiết phải đi lại toàn bộ con đường dẫn đến một thành tựu trước khi được phép sử dụng thành tựu đó hay không?

Bản thân nền khoa học hiện đại cũng không vận hành như vậy.

Một nhà vật lý sử dụng hàng loạt kết quả toán học mà họ chưa từng tự mình chứng minh. Một lập trình viên có thể xây dựng những hệ thống phức tạp mà không cần hiểu toàn bộ kiến trúc vi xử lý. Ngay cả trong toán học, một nhà nghiên cứu cũng thường viện dẫn những định lý thuộc các lĩnh vực mà họ không có đủ chuyên môn để tái lập toàn bộ chứng minh.

Sự chuyên môn hóa cho phép nhân loại xây dựng những hệ thống tri thức vượt xa khả năng lĩnh hội của bất kỳ một cá nhân nào.

Có lẽ AI chỉ đang đẩy quá trình này tiến thêm một bước nữa.

## Một kết quả đến sớm hơn thời đại của nó

Trong một cuộc trò chuyện với Numberphile trước đây, Terence Tao từng suy đoán rằng sự kết hợp giữa con người và AI có thể giúp giải quyết giả thuyết Riemann vào khoảng năm 2050.

Giả sử chứng minh của Alpöge và Claude thực sự đứng vững trước mọi quá trình thẩm định, và giả sử chúng ta cần thêm mười năm để hoàn toàn hiểu được những ý tưởng toán học bên trong nó.

Khi ấy, năm 2036, nhân loại sẽ có được cả lời giải lẫn những kiến thức cần thiết để lĩnh hội lời giải ấy.

Nếu lấy mốc dự đoán năm 2050 làm cơ sở so sánh, chúng ta vẫn có thể đã rút ngắn được khoảng 14 năm nghiên cứu. Chưa kể, trong mười năm đó, các nhà toán học hoàn toàn có thể sử dụng kết quả đã được xác minh để tiếp tục giải quyết những bài toán khác.

Tất nhiên, năm 2050 chỉ là một dự đoán, chứ không phải một mốc thời gian chắc chắn. Nhưng vấn đề đáng bàn nằm ở chỗ khác.

Trước đây, để tìm ra lời giải cho một bài toán, con người phải tự xây dựng những tri thức cần thiết trong quá trình đi đến lời giải.

Bây giờ, có thể chúng ta đã có thêm một phương thức nghiên cứu khác: tìm ra lời giải trước, sau đó truy ngược từ lời giải để khám phá những kiến thức cần thiết.

Thay vì phải dò đường trong một không gian tìm kiếm khổng lồ mà không biết đâu là đích đến, các nhà toán học đã có trong tay một con đường dẫn tới đích, dù con đường ấy còn dài, phức tạp và chưa được khảo sát đầy đủ.

Đây là hai bài toán rất khác nhau.

Thực tế, quá trình này đã bắt đầu. Michael Rubinstein đã công bố một bản thảo dài 164 trang nhằm diễn giải chứng minh cho trường hợp hàm zeta Riemann, chỉ một ngày sau khi mã Lean được công bố. Dù bản thảo vẫn cần được hoàn thiện, nó cho thấy việc chuyển đổi một chứng minh hình thức khổng lồ thành những lập luận mà con người có thể tiếp cận là một hướng nghiên cứu khả thi.

Có thể sau vài năm, từ 17 triệu dòng mã ấy, chúng ta sẽ chắt lọc được một số phương pháp mới, một vài bổ đề quan trọng, hoặc thậm chí một lý thuyết có khả năng tổng quát hóa toàn bộ chứng minh.

Nếu vậy, AI không những giúp chúng ta giải quyết được bài toán ban đầu, mà còn cung cấp nguyên liệu để phát triển những công cụ toán học mới.

Chỉ là thứ tự của quá trình khám phá đã thay đổi.

## Toán học sau những bài toán nút thắt

Một khía cạnh khác ít được nhắc đến trong các cuộc tranh luận là giá trị của giả thuyết Riemann đối với những công trình toán học khác.

Trong hơn một thế kỷ qua, đã có rất nhiều kết quả toán học được xây dựng dưới điều kiện giả thuyết Riemann đúng. Người ta vẫn có thể nghiên cứu những kết quả ấy, nhưng kết luận của chúng luôn mang theo một điều kiện chưa được giải quyết.

Về mặt logic, những công trình này không sai. Chúng chỉ có dạng:

*Nếu giả thuyết Riemann đúng, thì kết quả A cũng đúng.*

Khi giả thuyết Riemann được chứng minh, những kết quả có điều kiện tương ứng có thể trở thành những kết quả vô điều kiện.

Theo một nghĩa nào đó, các bài toán lớn như Riemann là những nút thắt trong mạng lưới tri thức toán học. Một bài toán chưa được giải quyết có thể giới hạn sự phát triển của rất nhiều bài toán khác.

Nếu AI có khả năng tháo gỡ những nút thắt ấy, thì các nhà toán học không nhất thiết phải ngừng công việc của mình. Ngược lại, họ có thể tiếp tục phát triển những ý tưởng mà trước đây bị giới hạn bởi các giả thuyết chưa được chứng minh.

Công việc của một nhà toán học cũng đâu chỉ có chứng minh định lý. Việc đặt ra những câu hỏi có ý nghĩa, lựa chọn các đối tượng nghiên cứu, phát hiện những mối liên hệ giữa các cấu trúc, xây dựng định nghĩa và tổng quát hóa các kết quả đều là những hoạt động quan trọng không kém.

Riemann không chỉ để lại cho nhân loại một bài toán khó. Điều đáng kể hơn là ông đã nhận ra rằng một hàm số trong giải tích phức có thể cung cấp những hiểu biết sâu sắc về sự phân bố của các số nguyên tố.

Tôi nghĩ rằng ngay cả trong một thế giới mà AI có thể giải quyết phần lớn những bài toán khó hiện tại, nhu cầu tìm kiếm những mối liên hệ như vậy vẫn sẽ tồn tại.

Toán học không nhất thiết sẽ chết đi vì sự xuất hiện của một công cụ mà chưa ai hoàn toàn hiểu được. Nó có thể chỉ đang chuyển từ một hình thái nghiên cứu sang một hình thái nghiên cứu khác.

## Vậy thì có gì đáng lo ngại?

Tôi từng đọc được một câu hỏi khá thú vị trên Reddit, đại ý rằng nếu nhân loại có thể tạo ra một nền toán học mà không ai hiểu hết, sử dụng nó để xây dựng một nền vật lý cũng không ai hiểu hết, nhưng từ đó lại phát triển được công nghệ dịch chuyển tức thời hay du hành thời gian, thì chúng ta có chấp nhận hay không?

Tôi nghĩ phần lớn chúng ta sẽ chấp nhận.

Xét trên phương diện thực dụng, việc một tri thức vượt quá khả năng lĩnh hội của con người không khiến nó mất đi giá trị. Nếu tri thức ấy có thể được xác minh, có thể đưa ra những dự đoán chính xác và có thể được ứng dụng một cách đáng tin cậy, thì việc từ chối sử dụng nó chỉ vì nó không được khám phá theo phương thức truyền thống có lẽ không phải là một lựa chọn hợp lý.

Nhưng tôi vẫn có một chút băn khoăn.

Tôi vốn thích toán học vì tính cô đọng của nó. Một lý thuyết đẹp không chỉ giúp chúng ta trả lời được nhiều câu hỏi, mà còn cho phép chúng ta hiểu được nhiều thứ hơn bằng một số lượng ý tưởng ít hơn.

Sự xuất hiện của AI có thể khiến tốc độ khám phá tri thức tăng lên rất nhiều, trong khi năng lực tiếp nhận và hệ thống hóa tri thức của con người không nhất thiết tăng lên tương ứng.

Nếu một chứng minh cần mười năm để lĩnh hội, có lẽ đó vẫn là một sự đánh đổi rất đáng giá. Nhưng nếu trong mười năm ấy, AI tiếp tục tạo ra hàng nghìn chứng minh khác, mỗi chứng minh lại được xây dựng trên những kiến thức mà chúng ta chưa kịp hiểu, thì câu chuyện sẽ trở nên phức tạp hơn.

Dần dần, việc nghiên cứu khoa học có thể không còn bị giới hạn chủ yếu bởi khả năng tìm ra lời giải, mà bởi khả năng chuyển những lời giải ấy thành tri thức mà con người có thể tiếp nhận và sử dụng một cách có ý thức.

Có lẽ vai trò quan trọng nhất của AI trong tương lai không chỉ là giải quyết những bài toán mà con người chưa giải được, mà còn là giúp con người hiểu được những bài toán mà chính AI đã giải.

Tôi không cho rằng chúng ta nên từ chối những thành tựu như chứng minh của Alpöge và Claude chỉ để bảo toàn một quan niệm truyền thống về vẻ đẹp của toán học. Làm vậy chẳng khác nào từ chối sử dụng kính thiên văn vì những ngôi sao mà nó nhìn thấy nằm ngoài khả năng quan sát của mắt thường.

Nhưng giữa việc sử dụng một công cụ để mở rộng khả năng nhận thức của mình và việc dần phó thác toàn bộ quá trình nhận thức cho công cụ ấy, tôi nghĩ vẫn có một sự khác biệt.

Có lẽ điều khiến tôi bất an không phải là viễn cảnh AI có thể giải được những bài toán mà con người không giải được.

Mà là viễn cảnh nó có thể giúp nhân loại biết thêm rất nhiều điều, trong khi bản thân con người lại ngày càng ít hiểu được những điều mình biết.

*I guess, I'm afraid.*

---

## Tài liệu đối chiếu

- [Thông báo của Levent Alpöge](https://alpo.ge/remark.pdf).
- [Thông cáo xác minh của Lean FRO và Mathlib Initiative, 21.11.2026](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/).
- [Michael Rubinstein: bản diễn giải và các kiểm tra Lean, gồm liên kết bản 164 trang ban đầu](https://www.math.uwaterloo.ca/~mrubinst/alpoge_claude_grh/).
