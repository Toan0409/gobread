from flask import Flask, request, render_template
import google.generativeai as genai
import os

# Cấu hình API Key
genai.configure(api_key="call api key ")

# Khởi tạo model
model = genai.GenerativeModel("gemini-1.5-flash")

app = Flask(__name__)

# Đường dẫn tuyệt đối tới file PDF
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PDF_PATH = os.path.join(BASE_DIR, "static", "tailieu.pdf")

@app.route("/", methods=["GET", "POST"])
def index():
    answer = ""
    question = ""

    if request.method == "POST":
        question = request.form.get("question", "")

        try:
            print("Tim file tai:", PDF_PATH)

            if not os.path.exists(PDF_PATH):
                raise FileNotFoundError(f"Không tìm thấy file tại: {PDF_PATH}")

            with open(PDF_PATH, "rb") as f:
                pdf_data = f.read()

            response = model.generate_content(
                contents=[
                    {
                        "mime_type": "application/pdf",
                        "data": pdf_data
                    },
                    question + " (Trả lời bằng tiếng Việt)"
                ]
            )

            answer = response.text

        except Exception as e:
            answer = f"Lỗi xử lý: {str(e)}"

    return render_template("index.html", answer=answer, question=question)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
