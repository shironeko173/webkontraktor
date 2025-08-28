<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
      <a href="index.html" class="app-brand-link">
        <img style="width: 150px"
        src="{{asset('backend/logo.png')}}" alt="">
       </a>
       <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
         <i class="bx bx-chevron-left bx-sm align-middle"></i>
       </a>
     </div>
    <div class="menu-inner-shadow"></div>
    <br>
    {{-- ================================================================================== --}}
    {{------------------------------------ DIREKTUR ------------------------------------------}}
    {{-- ================================================================================== --}}
    @if (Auth::user()->jabatan == 'Direktur' )
     
    <ul class="menu-inner py-1">
      <!-- Dashboard -->
      <li class="menu-item {{ Request::is('direktur_dashboard') ? 'active' : '' }}">
        <a href="/direktur_dashboard" class="menu-link">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div data-i18n="Analytics">Dashboard</div>
        </a>
      </li>


      <li class="menu-header small text-uppercase">
        <span class="menu-header-text">Project</span>
      </li>
          <li class="menu-item {{ Request::is('email-project') ? 'active' : '' }}">
            <a href="/email-project" class="menu-link">
              <i class="menu-icon tf-icons bx bx-mail-send"></i>
              <div data-i18n="Account">Email Project</div>
            </a>
          </li>
          <li class="menu-item {{ Request::is('Project-Berjalan') ? 'active' : '' }}">
            <a href="/Project-Berjalan" class="menu-link">
              <i class="menu-icon tf-icons bx bx-doughnut-chart"></i>
              <div data-i18n="Notifications">Project Berjalan</div>
            </a>
          </li>
          <li class="menu-item {{ Request::is('Project-Selesai') ? 'active' : '' }}">
            <a href="/Project-Selesai" class="menu-link">
              <i class="menu-icon tf-icons bx bx-check-square"></i>
              <div data-i18n="Connections">Project Selesai</div>
            </a>
          </li>


      <li class="menu-header small text-uppercase">
        <span class="menu-header-text">Users Setting</span>
      </li>

      
          <li class="menu-item {{ Request::is('user-info') ? 'active' : '' }}">
            <a href="/user-info" class="menu-link">
              <i class="menu-icon tf-icons bx bx-user"></i>
              <div data-i18n="Basic">User Info</div>
            </a>
          </li>
          <li class="menu-item {{ Request::is('add-user') ? 'active' : '' }}">
            <a href="/add-user" class="menu-link">
              <i class="menu-icon tf-icons bx bx-user-plus"></i>
              <div data-i18n="Basic">Add User</div>
            </a>
          </li>
      
      <!-- Components -->
      <li class="menu-header small text-uppercase"><span class="menu-header-text">Document</span></li>
      <!-- Cards -->
      <li class="menu-item {{ Request::is('dataAbsen') ? 'active' : '' }}">
        <a href="/dataAbsen" class="menu-link">
          <i class="menu-icon tf-icons bx bx-collection"></i>
          <div data-i18n="Basic">Laporan Absensi</div>
        </a>
      </li>
      <li class="menu-item {{ Request::is('repository-project') ? 'active' : '' }}">
        <a href="/repository-project" class="menu-link">
          <i class="menu-icon tf-icons bx bx-library"></i>
          <div data-i18n="Basic">Repository Project</div>
        </a>
      </li>

      <!-- Components -->
      <li class="menu-header small text-uppercase"><span class="menu-header-text">Website</span></li>
      <!-- Cards -->
      <li class="menu-item {{ Request::is('monitoring') ? 'active' : '' }}">
        <a href="/monitoring" class="menu-link">
          <i class="menu-icon tf-icons bx bx-window-alt"></i>
          <div data-i18n="Basic">Monitoring Aktivitas</div>
        </a>
      </li>
    </ul>

    {{-- ================================================================================== --}}
    {{------------------------------------ ADMIN WEB -----------------------------------------}}
    {{-- ================================================================================== --}}
    @elseif(Auth::user()->jabatan == 'AdminWeb')

      <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ Request::is('adminweb_dashboard') ? 'active' : '' }}">
          <a href="/adminweb_dashboard" class="menu-link">
            <i class="menu-icon tf-icons bx bx-home-circle"></i>
            <div data-i18n="Analytics">Dashboard</div>
          </a>
        </li>


        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">Project</span>
        </li>
            <li class="menu-item {{ Request::is('email-project') ? 'active' : '' }}">
              <a href="/email-project" class="menu-link">
                <i class="menu-icon tf-icons bx bx-mail-send"></i>
                <div data-i18n="Account">Email Project</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('Project-Berjalan') ? 'active' : '' }}">
              <a href="/Project-Berjalan" class="menu-link">
                <i class="menu-icon tf-icons bx bx-doughnut-chart"></i>
                <div data-i18n="Notifications">Project Berjalan</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('Project-Selesai') ? 'active' : '' }}">
              <a href="/Project-Selesai" class="menu-link">
                <i class="menu-icon tf-icons bx bx-check-square"></i>
                <div data-i18n="Connections">Project Selesai</div>
              </a>
            </li>


        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">Users Setting</span>
        </li>

        
            <li class="menu-item {{ Request::is('user-info') ? 'active' : '' }}">
              <a href="/user-info" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Basic">User Info</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('add-user') ? 'active' : '' }}">
              <a href="/add-user" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user-plus"></i>
                <div data-i18n="Basic">Add User</div>
              </a>
            </li>
        
        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text">Document</span></li>
        <!-- Cards -->
        <li class="menu-item {{ Request::is('dataAbsen') ? 'active' : '' }}">
          <a href="/dataAbsen" class="menu-link">
            <i class="menu-icon tf-icons bx bx-collection"></i>
            <div data-i18n="Basic">Laporan Absensi</div>
          </a>
        </li>
        <li class="menu-item {{ Request::is('repository-project') ? 'active' : '' }}">
          <a href="/repository-project" class="menu-link">
            <i class="menu-icon tf-icons bx bx-library"></i>
            <div data-i18n="Basic">Repository Project</div>
          </a>
        </li>
      </ul>

    {{-- ================================================================================== --}}
    {{--------------------------------- PROJECT MANAGER --------------------------------------}}
    {{-- ================================================================================== --}}
    @elseif(Auth::user()->jabatan == 'Project_Manager')
    
      <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ Request::is('projectmanager_dashboard') ? 'active' : '' }}">
          <a href="/projectmanager_dashboard" class="menu-link">
            <i class="menu-icon tf-icons bx bx-home-circle"></i>
            <div data-i18n="Analytics">Dashboard</div>
          </a>
        </li>

        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">Project</span>
        </li><li class="menu-item {{ Request::is('create-project') ? 'active' : '' }}">
              <a href="/create-project" class="menu-link">
                <i class="menu-icon tf-icons bx bx-folder-plus"></i>
                <div data-i18n="Account">Buat Project</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('projectmanager/sedang-berjalan') ? 'active' : '' }}">
              <a href="/projectmanager/sedang-berjalan" class="menu-link">
                <i class="menu-icon tf-icons bx bx-doughnut-chart"></i>
                <div data-i18n="Notifications">Project Berjalan</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('projectmanager/selesai') ? 'active' : '' }}">
              <a href="/projectmanager/selesai" class="menu-link">
                <i class="menu-icon tf-icons bx bx-check-square"></i>
                <div data-i18n="Connections">Project Selesai</div>
              </a>
            </li>

            
          <!-- Components -->
          <li class="menu-header small text-uppercase"><span class="menu-header-text">Akun Setting</span></li>
            <li class="menu-item {{ Request::is('edit-akun') ? 'active' : '' }}">
              <a href="/edit-akun" class="menu-link">
                <i class="menu-icon tf-icons bx bx-edit"></i>
                <div data-i18n="Basic">Edit Akun</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('edit-password') ? 'active' : '' }}">
              <a href="/edit-password" class="menu-link">
                <i class="menu-icon tf-icons bx bx-key"></i>
                <div data-i18n="Basic">Ganti Password</div>
              </a>
            </li>

            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Document</span></li>
        <!-- Cards -->
        <li class="menu-item {{ Request::is('repository-project') ? 'active' : '' }}">
          <a href="/repository-project" class="menu-link">
            <i class="menu-icon tf-icons bx bx-library"></i>
            <div data-i18n="Basic">Repository Project</div>
          </a>
        </li>
      </ul>


    {{-- ================================================================================== --}}
    {{---------------------------------- STAFF PROJECT ---------------------------------------}}
    {{-- ================================================================================== --}}
    @elseif(Auth::user()->jabatan == 'Drafter'|| Auth::user()->jabatan == 'Admin'|| Auth::user()->jabatan == 'Pengawas_Lapangan')

      <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ Request::is('stafflapangan_dashboard') ? 'active' : '' }}">
          <a href="/stafflapangan_dashboard" class="menu-link">
            <i class="menu-icon tf-icons bx bx-home-circle"></i>
            <div data-i18n="Analytics">Dashboard</div>
          </a>
        </li>

        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">Project</span>
        </li>
        
            <li class="menu-item {{ Request::is('My-Project/Sedang-Berjalan') ? 'active' : '' }}">
              <a href="/My-Project/Sedang-Berjalan" class="menu-link">
                <i class="menu-icon tf-icons bx bx-doughnut-chart"></i>
                <div data-i18n="Notifications">Project Berjalan</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('My-Project/Selesai') ? 'active' : '' }}">
              <a href="/My-Project/Selesai" class="menu-link">
                <i class="menu-icon tf-icons bx bx-check-square"></i>
                <div data-i18n="Connections">Project Selesai</div>
              </a>
            </li>


        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text">Akun Setting</span></li>
            <li class="menu-item {{ Request::is('edit-akun') ? 'active' : '' }}">
              <a href="/edit-akun" class="menu-link">
                <i class="menu-icon tf-icons bx bx-edit"></i>
                <div data-i18n="Basic">Edit Akun</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('edit-password') ? 'active' : '' }}">
              <a href="/edit-password" class="menu-link">
                <i class="menu-icon tf-icons bx bx-key"></i>
                <div data-i18n="Basic">Ganti Password</div>
              </a>
            </li>
        
      </ul>

    {{-- ================================================================================== --}}
    {{----------------------------------- STAFF KANTOR ---------------------------------------}}
    {{-- ================================================================================== --}}
    @elseif(Auth::user()->jabatan == 'Staff')

      <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ Request::is('staff_dashboard') ? 'active' : '' }}">
          <a href="/staff_dashboard" class="menu-link">
            <i class="menu-icon tf-icons bx bx-home-circle"></i>
            <div data-i18n="Analytics">Dashboard</div>
          </a>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text">Absensi Karyawan</span></li>

        <li class="menu-item {{ Request::is('absensi') ? 'active' : '' }}">
          <a href="/absensi" class="menu-link">
            <i class="menu-icon tf-icons bx bx-food-menu"></i>
            <div data-i18n="Basic">Absensi</div>
          </a>
        </li>
        <li class="menu-item {{ Request::is('My-Absensi') ? 'active' : '' }}">
          <a href="/My-Absensi" class="menu-link">
            <i class="menu-icon tf-icons bx bx-collection"></i>
            <div data-i18n="Basic">Laporan Absensi</div>
          </a>
        </li>

        <!-- Components -->
        <li class="menu-header small text-uppercase"><span class="menu-header-text">Akun Setting</span></li>
            <li class="menu-item {{ Request::is('edit-akun') ? 'active' : '' }}">
              <a href="/edit-akun" class="menu-link">
                <i class="menu-icon tf-icons bx bx-edit"></i>
                <div data-i18n="Basic">Edit Akun</div>
              </a>
            </li>
            <li class="menu-item {{ Request::is('edit-password') ? 'active' : '' }}">
              <a href="/edit-password" class="menu-link">
                <i class="menu-icon tf-icons bx bx-key"></i>
                <div data-i18n="Basic">Ganti Password</div>
              </a>
            </li>
      </ul>

    @endif
      



  </aside>