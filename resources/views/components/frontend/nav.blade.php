<section class="">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="{{ route('index')}}"><img style="width: 130px;"
                        src="{{ asset('assets/images/logo.png') }}" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                    aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav" style="justify-content: end;">
                    <ul class="navbar-nav ml-auto mr-md-3">
                        <li class="nav-item {{ request()->routeIs('index')?'active':'' }}"><a href="{{ route('index') }}" class="nav-link">Home</a></li>
                        <li class="nav-item {{ request()->routeIs('about')?'active':'' }}"><a href="{{ route('about') }}" class="nav-link">About</a></li>
                        <li class="nav-item {{ request()->routeIs('shop')?'active':'' }}"><a href="{{ route('shop') }}" class="nav-link">Shop</a></li>
                        <li class="nav-item {{ request()->routeIs('contact')?'active':'' }}"><a href="{{ route('contact') }}" class="nav-link">Contact</a></li>
                        <li class="dropdown nav-item d-md-flex align-items-center">
                            <a href="{{ route('cart') }}" class="icon-cart" style="font-size: 18px;">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
    </div>

</section>