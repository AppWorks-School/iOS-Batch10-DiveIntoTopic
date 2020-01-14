# Initializer

1. 
    Create 一個 `class Person`，擁有一個 property `name`, 型別為 `String`
    建立一個 `Initializer`，擁有一個 parameter `name`，型別為 `String`
    利用這個 Initializer create 一個 `Person` Object, name 為 `Bethany`，儲存在名為 `iOSDevelper` 的變數裡面

2. 
    Create 一個 `class Animal`，擁有一個 property `name`, 型別為 `String`
    建立一個 `Initializer`，沒有任何 parameter
    利用這個 Initializer create 一個 `Animal` Object, name 為 `Dog`，儲存在名為 `dog` 的變數裡面

3. 下列的程式碼是有錯誤的，請試著修改 Initializer 來修復錯誤

```swift
class Luke {
    
    let name: String
    
    init() {
        
    }
}
```

4. 請問 Console 會出現什麼

```swift
class Classroom {
    
    var studentNumber: Int
    
    init() {
        
        print("Init")
        
        studentNumber = 10
    }
    
    init(number: Int) {
        
        print("Init with number")
        
        studentNumber = number
    }
}

let appWorksSchool = Classroom()
```

5. 
    Create 一個 `struct Fruit`，擁有一個 property `name`, 型別為 `String`
    Create 一個 `Fruit Object`, name 為 `Apple`，儲存在名為 `apple` 的變數裡面

6. 
    Create 一個 `struct Car`，擁有一個 property `color`, 型別為 `String`
    Create 一個 `Car Object`, color 為 `blue`，儲存在名為 `benz` 的變數裡面

7. 請問下列程式碼有錯誤嗎？

```swift
struct People {
    
    let name: String
}

let luke = People(name: "Luke")
```

8. 請問下列程式碼有錯誤嗎？

```swift
class People {
    
    let name: String
}

let luke = People(name: "Luke")
```

9. 請問要 Create 一個 Initializer 的話，關鍵字為何？

10. 請問要如何使用 Initializer？

11. 一個物件要被 Initialize 的話，有什麼條件要滿足？