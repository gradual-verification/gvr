# Gradual Verification for Rust 

This repository documents our progress on supporting gradual verification within [Prusti], a deductive verifier for Rust. Prusti encodes the assumptions of Rust's borrow checker into separation logic, which is validated using the Viper verification infrastructure. We use *Gradual Viper* to support optimistic runtime checking using the same framework. 

## Setup
Using docker, execute `docker build . -t [tag]` to build our image, which will initialize all dependencies. 
