from pymongo import MongoClient
import time

client = MongoClient("mongodb://localhost:27017")
db = client["performance_test"]
collection = db["sales"]

start = time.time()
results = list(collection.find({"category": "Electronics"}))
end = time.time()

print(f"Time taken: {end - start:.6f} seconds")
print(f"Documents found: {len(results)}")
