// объявление билиотек
const { expect } = require("chai")
const { ethers } = require("hardhat")

describe("Payments", function()  {
  let acc1
  let acc2
  let payments

    beforeEach(async function() {
        [acc1, acc2] =  await ethers.getSigners() // адреса использующиеся
        // получение инфы о скомпилированной версии контракта
        const Payments = await ethers.getContractFactory("Payments", acc1)
        payments = await Payments.deploy() // разворачиваем контракт; ждем пока будет развернут
        await payments.deployed() // ждем пока транзакция будет выполнена
       // console.log(payments.address) отображение адреса
    })

 it("Should be deployed", async function(){
    expect(payments.address).to.be.properAddress
 }) 

 it("should have 0 ether by default", async function(){
     const balance = await payments.currentBalance()
  //   console.log(balance) // отображение баланса
  expect(balance).to.eq(0) // для проверки если значение баланса равно нулю
 })

 it("should be possible to send founds", async function(){
     const sum =100
     const msg = "hello man!"
     //const kolvo = await payments.pay("hello man!",{value: 100}) // перевод денег от первого аккаунта в рамках доступных акков
     const kolvo = await payments.connect(acc2).pay(msg,{value: 100})
    // чтобы перевод происходил с второго аккаунта

   /* await expect(() => kolvo )  // проверка что на втором аккаунте будет снято 100 единиц
    .to.changeEtherBalance(acc2, -100)*/

    await expect(() => kolvo )  // проверка перевода с одного аккаунта на другой
    .to.changeEtherBalances([acc2, payments], [-sum, sum]);

     await kolvo.wait() // для ожидания завершенния 

  //   const balance= await payments.currentBalance()
   // console.log(balance) // для проверки нового баланса 

   // вывести данные об адресе
   const newPayment = await payments.getPayment(acc2.address, 0)
   expect(newPayment.message).to.eq(msg)
   expect(newPayment.amount).to.eq(sum)
   expect(newPayment.from).to.eq(acc2.address)
 })

})