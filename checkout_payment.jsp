<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/datepicker.min.js"></script>

</head>
<body>
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

    <!-- ----------------BODY-------------------- -->
   
    <div class="grid grid-rows-3 grid-flow-col gap-4">

<!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->
        <div class="row-span-3  ml-10 mx-auto my-16">
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-16 py-3">
                            <span class="sr-only">Image</span>
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Product
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Quantity
                        </th>
                        <th scope="col" class="px-6 py-3">
                           Price per Day
                        </th>

                        <th scope="col" class="px-6 py-3">
                            Total price for ${booked_days} days
                         </th>
                        
                    </tr>
                </thead>

                <c:set var="total" value="0" />

                <tbody id="tbody">
                    <c:forEach var="invoice_item" items="${invoice_items}" varStatus="cn">
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
          
          
                        <td class="p-4">
                            <img src="show_tentwala_pic.do?picPath=${invoice_item.tentwalaItem.tentwalaItemPic}&tentwalaEmail=${tentwala_email}&flag=true" class="w-16 md:w-32 max-w-full max-h-full" alt="">
                        </td>
                        <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                            ${invoice_item.tentwalaItem.item.name}
                        </td>
                        <td class="px-6 py-4">
                            <div class="flex items-center">
                                <div>
                                    <input type="number" disabled value="${invoice_item.bookedQuantity}" id="first_product" class="bg-gray-50 w-14 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block px-2.5 py-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="1">
                                </div>
                                
                            </div>
                        </td>
                        <td class="px-12 py-4 font-semibold text-gray-900 dark:text-white">
                            ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice} RS.
                        </td>
                        
                        <td class="px-16 py-4  font-semibold text-gray-900 dark:text-white">
                            ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice*booked_days} RS.
                        </td>
                        
                        <c:set var="total" value="${total + invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice*booked_days}" />

                      </tr>
                  </c:forEach>

                </tbody>

                <tfoot>
                    <tr class="font-semibold text-gray-900 dark:text-white">
                        <th scope="row" class="px-6 py-3 text-4xl font-medium text-gray-900 dark:text-white">Total</th>
                        <td class="px-6 py-3"></td>
                        <td class="px-6 py-3"></td>
                        <td class="px-6 py-3"></td>
                        <td class="px-14 py-3 text-lg"><b>${total} RS.</b> </td>
                    </tr>
                </tfoot>
            </table>
            </div>
        </div>
<!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->

<!-- --------------------RIGHT SIDE SCREEN------------------------------------------ -->
         <div class="bg-gray-50 row-span-3 min-h-full flex-col justify-center px-6 pt-16 pb-24 lg:px-8">
            <form action="order_placed.do" method="post">
            <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold leading-7 text-gray-900">Checkout Information</h2>
                <p class="mt-1 text-sm leading-6 text-gray-600">Use a permanent address where you can receive delivery.</p>
          
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                  <div class="sm:col-span-3">
                    <label for="first-name" class="block text-sm font-medium leading-6 text-gray-900">Tentwala Name</label>
                    <div class="mt-2">
                      <input type="text" disabled value="${tentwala_name}"  id="first-name" required autocomplete="given-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>
          
                  <div class="col-span-full">
                    <label for="street-address" class="block text-sm font-medium leading-6 text-gray-900">Tentwala Address</label>
                    <div class="mt-2">
                      <input type="text" value="${tentwala_address}"  name="street-address" id="street-address" autocomplete="street-address" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>
          
                  <div class="col-span-full">
                    <label for="street-address" class="block text-sm font-medium leading-6 text-gray-900">Your Address</label>
                    <div class="mt-2">
                      <input type="text" readonly value="${delivery_address}" name="street-address" id="street-address" autocomplete="street-address" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>
          
                  <div class="sm:col-span-2">
                    <label for="region" class="block text-sm font-medium leading-6 text-gray-900">Booked From</label>
                    <div class="mt-2">
                      <input type="text" readonly value="${booked_from}" name="region" id="region" autocomplete="address-level1" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>
          
                  <div class="sm:col-span-2">
                    <label for="postal-code" class="block text-sm font-medium leading-6 text-gray-900">Booked To</label>
                    <div class="mt-2">
                      <input type="text" readonly value="${booked_to}" name="postal-code" id="postal-code" autocomplete="postal-code" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>

                  <div class="sm:col-span-2">
                    <label for="postal-code" class="block text-sm font-medium leading-6 text-gray-900">Total Days</label>
                    <div class="mt-2">
                      <input type="text" name="postal-code" readonly value="${booked_days}" id="postal-code" autocomplete="postal-code" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>

                  <div class="sm:col-span-3">
                    <label for="first-name" class="block text-sm font-medium leading-6 text-gray-900">Total Price to Pay</label>
                    <div class="mt-2">
                      <input type="text" disabled value="${total}"  id="first-name" required autocomplete="given-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                  </div>
                </div>
              </div>
                
            <div>
                <button type="button" class="text-white bg-[#050708] hover:bg-[#050708]/80 focus:ring-4 focus:outline-none focus:ring-[#050708]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:hover:bg-[#050708]/40 dark:focus:ring-gray-600 me-2 mb-2">
                    <svg class="w-5 h-5 me-2 -ms-1" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="apple" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="currentColor" d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg>
                    Check out with Apple Pay
                    </button>

                    <button type="button" class="text-white bg-[#2557D6] hover:bg-[#2557D6]/90 focus:ring-4 focus:ring-[#2557D6]/50 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-[#2557D6]/50 me-2 mb-2">
                        <svg aria-hidden="true" class="w-18 h-5 me-2 -ms-1" viewBox="0 0 256 64" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M28.812 0L0 63.76H34.492L38.768 53.594H48.542L52.818 63.76H90.784V56.001L94.167 63.76H113.806L117.189 55.837V63.76H196.148L205.749 53.858L214.739 63.76L255.294 63.842L226.391 32.058L255.294 0H215.368L206.022 9.71899L197.315 0H111.418L104.042 16.457L96.493 0H62.073V7.495L58.244 0C58.244 0 28.812 0 28.812 0ZM35.486 9.05399H52.299L71.41 52.29V9.05399H89.828L104.589 40.054L118.193 9.05399H136.519V54.806H125.368L125.277 18.955L109.02 54.806H99.045L82.697 18.955V54.806H59.757L55.408 44.549H31.912L27.572 54.797H15.281C15.281 54.797 35.486 9.05399 35.486 9.05399ZM146.721 9.05399H192.063L205.931 24.034L220.246 9.05399H234.114L213.043 32.049L234.114 54.779H219.617L205.749 39.625L191.361 54.779H146.721V9.05399ZM43.665 16.795L35.924 35.067H51.397L43.665 16.795ZM157.918 18.527V26.879H182.654V36.188H157.918V45.306H185.663L198.555 31.876L186.21 18.519H157.918V18.527Z" fill="white"/></svg>
                        Pay with American Express
                        </button>
            </div>
                
                
                <div>
                  <button type="submit"  id="next_btn" class="flex w-full justify-center rounded-md bg-gradient-to-r from-violet-500 to-fuchsia-500 px-3 py-3 text-sm font-semibold leading-6 text-white shadow-2xl hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"><b>PLACE ORDER</b></button>
                </div>
  
              </div>
              </form>
        </div> 
<!-- --------------------RIGHT SIDE SCREEN------------------------------------------ -->
      </div>

    <!-- ----------------BODY-------------------- -->

    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        <!-- </div>
    </div> -->
    <!-- #################FOOTER#################### -->

    <script>
        let about=document.querySelector("#about")
        about.innerText="Find TentWale!"
        about.href="find_tentwale.do"

        let service=document.querySelector("#services")
        service.classList.add("hidden")
        
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>