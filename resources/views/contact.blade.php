<x-guest-layout>
    @section('title',$title)
    <x-frontend.page-banner :pageTitle=$pageTitle :pageDesc=$pageDesc/>
    
    <section class="py-5">
        <div class="container">
            <div class="row g-4">
    
                <div class="col-lg-4">
                    <div class="contact-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="contact-icon me-3">📍</div>
                            <h5 class="mb-0">Our Address</h5>
                        </div>
                        <p class="text-muted mb-0">
                            MyMart Fashion Store<br>
                            Dhaka, Bangladesh
                        </p>
                    </div>
                </div>
    
                <div class="col-lg-4">
                    <div class="contact-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="contact-icon me-3">📞</div>
                            <h5 class="mb-0">Phone</h5>
                        </div>
                        <p class="text-muted mb-0">
                            +880 1XXX-XXXXXX
                        </p>
                    </div>
                </div>
    
                <div class="col-lg-4">
                    <div class="contact-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="contact-icon me-3">✉️</div>
                            <h5 class="mb-0">Email</h5>
                        </div>
                        <p class="text-muted mb-0">
                            support@mymart.com
                        </p>
                    </div>
                </div>
    
            </div>
        </div>
    </section>
    
    <section class="pb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
    
                    <div class="border rounded p-4 shadow-sm">
                        <h3 class="fw-bold text-primary-custom mb-4 text-center">
                            Send Us a Message
                        </h3>
    
                        <form method="POST" action="#">
    
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Your Name</label>
                                    <input type="text" class="form-control" placeholder="Enter your name">
                                </div>
    
                                <div class="col-md-6">
                                    <label class="form-label">Email Address</label>
                                    <input type="email" class="form-control" placeholder="Enter your email">
                                </div>
    
                                <div class="col-12">
                                    <label class="form-label">Subject</label>
                                    <input type="text" class="form-control" placeholder="Subject">
                                </div>
    
                                <div class="col-12">
                                    <label class="form-label">Message</label>
                                    <textarea class="form-control" rows="5" placeholder="Write your message"></textarea>
                                </div>
    
                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-accent px-5 py-2">
                                        Send Message
                                    </button>
                                </div>
                            </div>
    
                        </form>
                    </div>
    
                </div>
            </div>
        </div>
    </section>
</x-guest-layout>
