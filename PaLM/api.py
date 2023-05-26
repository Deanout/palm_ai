from flask import Flask, request, jsonify
import palm

app = Flask(__name__)

@app.route("/generate", methods=["POST"])
def generate():
    data = request.json
    prompt = data.get("prompt")
    seq_len = data.get("seq_len", 256)
    temperature = data.get("temperature", 0.8)
    filter_thres = data.get("filter_thres", 0.9)
    model = data.get("model", "palm_1b_8k_v0")
    dtype = data.get("dtype", "fp32")

    # Call your main function
    generated_text = palm.generate(
        prompt, seq_len, temperature, filter_thres, model, dtype
    )

    # Return the generated text as a json response
    return jsonify(generated_text)

@app.route("/test", methods=["get"])
def test():
    prompt = "Hello world!"
    seq_len = request.args.get("seq_len", default=25, type=int)
    temperature = request.args.get("temperature", default=0.8, type=float)
    filter_thres = request.args.get("filter_thres", default=0.9, type=float)
    model = request.args.get("model", default="palm_1b_8k_v0")
    dtype = request.args.get("dtype", default="fp32")

    # Call your main function
    generated_text = palm.generate(
        prompt, seq_len, temperature, filter_thres, model, dtype
    )

    # Return the generated text as a json response
    return jsonify(generated_text)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
