class Vp1lightMac < Formula

  desc "The VP1light HEP event and geometry display"
  homepage "http://atlas-vp1.web.cern.ch/atlas-vp1/home/"

  # SOURCES
  #url "https://gitlab.cern.ch/rbianchi/athena/-/archive/1.0/athena-1.0.zip"
  #sha256 "f9011ede226651efbb8ab5f3e347853fc671d9dbda4f5499aa5d592b9d522ec5"
  url "https://gitlab.cern.ch/rbianchi/athena/-/archive/1.1/athena-1.1.zip"
  #sha256 ""

  # DEPENDENCIES
  depends_on "cmake" => :build
  depends_on "boost" # tested OK with boost v. 1.70
  depends_on "clhep" # tested OK with 2.4.1.2
  depends_on "eigen"

  #depends_on "https://gitlab.cern.ch/GeoModelDev/packaging/homebrew-geomodel/raw/master/geomodelcore.rb"
  depends_on "atlas/geomodel/geomodelcore" => :recommended
  depends_on "atlas/geomodel/geomodelio" => :recommended

  depends_on "ric-bianchi/coin3d/simage"
  depends_on "ric-bianchi/coin3d/coin-bb"
  depends_on "ric-bianchi/coin3d/soqt-bb"

  #depends_on "ric-bianchi/vp1light/clhep@2.4.1.0" # the bottle below has been built with this version, it complains with newest
  depends_on "ric-bianchi/vp1light/vp1light-root"
  depends_on "ric-bianchi/vp1light/vp1light-googletest"
  depends_on "ric-bianchi/vp1light/heputils"
  depends_on "ric-bianchi/vp1light/mcutils"
  depends_on "ric-bianchi/vp1light/heppdt"

  # COMPILATION INSTRUCTIONS
  def install
       ENV.deparallelize
       ENV["ROOTSYS"]    = "/usr/local"
       ENV["LIBPATH"]    = "/usr/local/lib/root"
       ENV["SHLIB_PATH"] = "/usr/local/lib/root"
       mkdir "builddir" do
       system "echo $PATH "
       system "cmake", "../Projects/VP1LightPackaging", "-DCMAKE_CXX_COMPILER=/usr/bin/clang++", *std_cmake_args
       system "make", "install"
    end
  end

  # PRE-COMPILED PACKAGES ("Bottles")
  bottle do
    root_url "http://atlas-vp1.web.cern.ch/atlas-vp1/sources/bottles"
    cellar :any
    sha256 "a69993442aa3e19e2c6df9126dcaec8622a6354df76531a6777b9609a6338b86" => :mojave
  end

end
