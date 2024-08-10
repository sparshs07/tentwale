<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />

</head>
<body>
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

<!-- ##############################BODY############################ -->



<div class="max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
    <a href="#">
        <img class="rounded-t-lg" src="static/images/mitchell-lawler-tbaoryUol_E-unsplash.jpg" alt="" />
    </a>
    <div class="p-5">
        <a href="#">
            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Your Order is Placed Successfully!</h5>
        </a>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Your Order Id:498290878923498009</p>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Our Tentwala will contact you shortly!</p>
        <a href="#" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
            Read more
             <svg class="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
            </svg>
        </a>
    </div>
</div>






<!-- ##############################BODY############################ -->


    <!-- #################FOOTER#################### -->
    <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0">
            <c:import url="footer.jsp" />
        </div>
    </div>
    <!-- #################FOOTER#################### -->

   
   <!-- --------------------------MENU BUTTON------------------------ -->
<script>
  let home=document.querySelector("#home")
  home.href="tentwala_home.do"
  
  let about=document.querySelector("#about")
  about.innerText="Add Items"
  about.href="tentwala_home_profile.do"
  
  let services=document.querySelector("#services")
  services.innerText="Your Items"
  services.href="your_items.do"
  </script>
<!-- --------------------------MENU BUTTON------------------------ -->


    <!-- ----------------HIDDING----------------------- -->
    <script>
        let want_bec_tentw=document.querySelector("#want_bec_tentw");
        want_bec_tentw.classList.add("hidden");
    </script>
    <!-- ----------------HIDDING----------------------- -->

    <!-- ------------------Display Tentwala Name------------------ -->
    <script>
      let display_name=document.querySelector("#display_name");
      let tentwala_name="${user.tentwalaName}"
      display_name.innerHTML=tentwala_name
    </script>
    <!-- ------------------Display Tentwala Name------------------ -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>