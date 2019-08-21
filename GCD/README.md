# GCD

### Before Assignment

下列為臺北市 [Open API](https://data.taipei/#/) 所提供之[臺北市固定測速照相地點表](https://data.taipei/#/dataset/detail?id=745b8808-061f-4f5b-9a62-da1590c049a9) API 格式：

* **URL:** https://data.taipei/opendata/datalist/apiAccess

* **Method:** `GET`

* **Header Params:** None

* **Query String**

| Field | Value |
| :---: | :---: |
| scope | resourceAquire |
| rid | 5012e8ba-5ace-4821-8482-ee07c147fd0a |
| limit | Depends. 代表筆數上限(1000)|
| offset |  Depends. 代表位移筆數|

* **Request Example:**

```
https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=0
```

* **Success Response: 200**

```
{
    "result": {
        "limit": 1,
        "offset": 0,
        "count": 143,
        "sort": "",
        "results": [
            {
                "functions": "測速",
                "area": "士林",
                "no": "1",
                "direction": "南向北",
                "speed_limit": "50",
                "location": "葫蘆街",
                "_id": 1,
                "road": "環河北路3段"
            }
        ]
    }
}
```

### Assignment

1. 設計一個 App，畫面上有 6 個 UILabel，位置沒有限制。
2. 請利用上述 API，分別拿取 offset 為 0, 10, 20 的固定測速照相資料，Limit 都設定為 1 即可。
3. 每兩個 UILabel 為一組，分別顯示 Response 中，"road" 與 "speed_limit" 的資料。
4. 將步驟 2 的三個 Request 所拿到的 Response
- 利用 GCD Group 的特性，將三個 Response 的資料，`同時` 呈現在畫面上。
- 利用 GCD Semaphore 的特性，將三個 Response 的資料，依照 offset 的順序，`依序` 呈現在畫面上。