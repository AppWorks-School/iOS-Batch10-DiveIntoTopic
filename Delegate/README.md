# Delegate

### Before Assignment

下圖是 [2019 Mopcon](https://mopcon.org/2019/) 官方 iOS APP 的 gif 檔，可以看到在**議程**頁面與**社群頁面**底下，各有一個可以切換畫面內容的 `View`, 分別是切換不同日期的議程與主辦社群與志工組織的類別。

<img src="https://github.com/Wuchiwei/iOS/blob/master/Delegate/images/2019_mopcon.gif" alt="2019 MOPCON" width="433" height="860">

### Assignment
請設計一個 Class 名為 `SelectionView`，其所擁有的功能如下：

1. `SelectionView` 可以提供類似 Button 的效果，讓使用者可以與 `SelectionView` 互動；當點選了某一個選項的時候，底下的 `IndicatorView` 會移動到使用者點選的選項下方。

2. 想要與用 `SelectionView` 的 ViewController, 只要執行以下步驟，就可以擁有一個可以使用的畫面:
   * Create 一個 `SeletionView` 的 Instance，並將它加到畫面上。
   * ViewController Conform SelectionDataSource 還有 SelectionViewDelegate。
   * ViewController 將自己 assign 到 `SelectionView` **dataSource** 還有 **delegate** 變數中，讓 SelectionView 可以正常運作。

**SelectionView DataSource** 可以控制：

1. 總共有幾個選項，預設為兩個
2. 每個選項上面的文字
3. 底線的顏色，預設為藍色
4. 選項文字的顏色，預設為白色
5. 選項文字的 Font，預設為 `UIFont.systemFont(ofSize: 18)`

**SelectionView Delegate** 可以控制：

要特別注意的是，以下兩個事件要設計成 **Optional** 的，亦即 conform protocol 的 class 要不要實作都沒關係：

1. 使用者選擇了哪一個選項。
2. 控制使用者是否可以選擇某一個選項，當不能選擇的時候，`IndicatorView` 不會移動，使用者選擇選項的 `Delegate method` 也**不會被觸發**。

### Result

如果成功地完成了 `SelectionView`，可以利用這個 `SelectionView` 完成下列的 App

1. 上下各有一個 SelectionView，一個有兩個選項，一個有三個選項。
2. 點選 SelectionView 內的選項，底下有一個 View 會跟著變色。
3. 如果上方的 SelectionView 目前選取的 button 是最後一個，那下方的 SelectionView 則不可以被使用者控制。

<img src="https://github.com/Wuchiwei/iOS/blob/master/Delegate/images/DelegatePractice.gif" alt="2019 MOPCON" width="433" height="860">