# barbershop

BarberShop App no DW11

## Getting Started

catalunha@pop-os:~/myapp/dw11/barbershop/api$ jrs run
catalunha@pop-os:~/myapp/dw11/barbershop$ dart run build_runner watch -d
catalunha@pop-os:~/myapp/dw11/barbershop$ flutter pub add intl


# Duvidas
# 1
O uso do AsyncStateBuilder é apenas para tornar os loader mais acessiveis globalmente com
    final asyncLoaderHandler = AsyncLoaderHandler()..start();
    // async actions
    asyncLoaderHandler.close();
Eu usava o ref.listen(...) pra fazer isto.

# 2 Alternatives ao syncfusion
https://pub.dev/packages/time_planner

Falando em licenças. Qual posso usar em meus app MIT, etc ?
