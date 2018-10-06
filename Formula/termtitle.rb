class Termtitle < Formula
  desc "A command line program to change macOS terminal title"
  homepage "https://github.com/grimmer0125/termtitle/"
  url "https://github.com/grimmer0125/termtitle/archive/v0.1.9.tar.gz"
  sha256 "13e81268067a3e22a960610fcd810dce1a23fe0118648adc03078e6c071836c5"

  def install
    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir["#{libexec}/bin/*"]
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
  test do
    system "#{bin}/termtitle", "new_title"
  end
end
